part of 'part_five_cubit.dart';

enum PartTwoFiveStaus { intial, loading, successful, error }

class PartFiveState extends Equatable {
  final PartTwoFiveStaus partTwoFiveStaus;
  final String? error;

  const PartFiveState({
    required this.partTwoFiveStaus,
    this.error,
  });

  factory PartFiveState.initial() {
    return PartFiveState(partTwoFiveStaus: PartTwoFiveStaus.intial);
  }

  PartFiveState copyWith({
    final PartTwoFiveStaus? partTwoOneStaus,
    final String? error,
    // final PartTwoOneModel? partTwoOneModel,
  }) {
    return PartFiveState(
      partTwoFiveStaus: partTwoOneStaus ?? this.partTwoFiveStaus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error, partTwoFiveStaus];
}
