part of 'part_two_three_cubit.dart';

enum PartTwoThreeStaus { intial, loading, successful, error }

class PartTwoThreeState extends Equatable {
  final PartTwoThreeStaus partTwoThreeStaus;
  final String? error;
  final PartTwoThreeModel? partTwoThreeModel;

  const PartTwoThreeState(
      {required this.partTwoThreeStaus, this.error, this.partTwoThreeModel});

  factory PartTwoThreeState.initial() {
    return PartTwoThreeState(partTwoThreeStaus: PartTwoThreeStaus.intial);
  }

  PartTwoThreeState copyWith({
    final PartTwoThreeStaus? partTwoThreeStaus,
    final String? error,
    final PartTwoThreeModel? partTwoThreeModel,
  }) {
    return PartTwoThreeState(
      partTwoThreeStaus: partTwoThreeStaus ?? this.partTwoThreeStaus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        partTwoThreeStaus,
      ];
}
