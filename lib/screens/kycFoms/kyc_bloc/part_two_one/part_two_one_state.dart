part of 'part_two_one_cubit.dart';

enum PartTwoOneStaus { intial, loading, successful, error }

class PartTwoOneState extends Equatable {
  final PartTwoOneStaus partTwoOneStaus;
  final String? error;

  const PartTwoOneState({
    required this.partTwoOneStaus,
    this.error,
  });

  factory PartTwoOneState.initial() {
    return PartTwoOneState(partTwoOneStaus: PartTwoOneStaus.intial);
  }

  PartTwoOneState copyWith({
    final PartTwoOneStaus? partTwoOneStaus,
    final String? error,
  }) {
    return PartTwoOneState(
      partTwoOneStaus: partTwoOneStaus ?? this.partTwoOneStaus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error, partTwoOneStaus];
}
