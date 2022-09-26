part of 'pan_kycverification_cubit.dart';

enum PanVerificationStaus { Initial, Loading, Completed, Error }

class PanKycverificationState extends Equatable {
  final PanVerificationStaus panVerificationStaus;
  final PanVerificationModel? panVerificationModel;
  final String? errorMessage;

  PanKycverificationState({
    required this.panVerificationStaus,
    this.panVerificationModel,
    this.errorMessage,
  });

  factory PanKycverificationState.initial() {
    return PanKycverificationState(
        panVerificationStaus: PanVerificationStaus.Initial);
  }

  PanKycverificationState copyWith({
    final PanVerificationStaus? panVerificationStaus,
    final PanVerificationModel? panVerificationModel,
    final String? errorMessage,
  }) {
    return PanKycverificationState(
      panVerificationStaus: panVerificationStaus ?? this.panVerificationStaus,
      panVerificationModel: panVerificationModel ?? this.panVerificationModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [panVerificationStaus, panVerificationModel, errorMessage];
}
