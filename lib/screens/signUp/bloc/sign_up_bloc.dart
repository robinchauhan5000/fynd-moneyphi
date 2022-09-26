import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyphi/Model/SIgnUpModel.dart';
import 'package:moneyphi/controller/SignUpRepo.dart';
import 'package:moneyphi/utils/validators.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> with ValidationMixin {
  final SignUpRepo _signUpRepo;
  SignUpBloc({required SignUpRepo signUpRepo})
      : _signUpRepo = signUpRepo,
        super(SignUpState.initial()) {
    on<SignUpFormSubmitEvent>((event, emit) async {
      emit(state.copyWith(signUpStatus: SignUpStatus.loading));
      try {
        var data = await _signUpRepo.SignUp(
            email: event.email, phone: event.phoneNmber, pass: event.password);

        print('datasddssdds');
        print(data['success']);
        if (data['token'] != null) {
          SignupApiModel model = SignupApiModel.fromJson(data);
          emit(state.copyWith(
              signUpStatus: SignUpStatus.successful, signupApiModel: model));
        }
        if (data['isInvestorExist'] == true) {
          emit(state.copyWith(
              signUpStatus: SignUpStatus.error,
              apiError: "User is already Registered"));
        }

        if (data['success'] == false) {
          emit(state.copyWith(
              signUpStatus: SignUpStatus.error,
              apiError: data['errorMessage']));
        }
      } catch (e) {
        emit(state.copyWith(
            signUpStatus: SignUpStatus.error, apiError: e.toString()));
      }
    });
  }
}
