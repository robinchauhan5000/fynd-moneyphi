part of 'sign_up_bloc.dart';

enum SignUpStatus { intial, loading, successful, error }

class SignUpState extends Equatable {
  final SignUpStatus signUpStatus;
  final SignupApiModel? signupApiModel;
  final String? apiError;
  final bool? isEmailValid;
  final bool? isPasswordMatched;
  final bool? isviledPhone;
  final bool showPassWord;

  SignUpState(
      {required this.signUpStatus,
      this.signupApiModel,
      this.apiError,
      this.isEmailValid,
      this.isPasswordMatched,
      this.isviledPhone,
      this.showPassWord = false});

  factory SignUpState.initial() {
    return SignUpState(signUpStatus: SignUpStatus.intial);
  }

  SignUpState copyWith({
    final SignUpStatus? signUpStatus,
    final SignupApiModel? signupApiModel,
    final String? apiError,
    final bool? isEmailValid,
    final bool? isPasswordMatched,
    final bool? isviledPhone,
    final bool? showPassWord,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      signupApiModel: signupApiModel ?? this.signupApiModel,
      apiError: apiError ?? this.apiError,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordMatched: isPasswordMatched ?? this.isPasswordMatched,
      isviledPhone: isviledPhone ?? this.isviledPhone,
      showPassWord: showPassWord ?? this.showPassWord,
    );
  }

  @override
  List<Object?> get props => [
        signupApiModel,
        signUpStatus,
        apiError,
        showPassWord,
        isEmailValid,
        isPasswordMatched,
        isviledPhone
      ];
}
