part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpFormSubmitEvent extends SignUpEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNmber;

  SignUpFormSubmitEvent(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phoneNmber});

  @override
  List<Object?> get props => [email, password, confirmPassword, phoneNmber];
}
