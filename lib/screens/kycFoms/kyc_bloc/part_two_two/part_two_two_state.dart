part of 'part_two_two_cubit.dart';

enum PartTwoTwoStaus { intial, loading, successful, error }

class PartTwoTwoState extends Equatable {
  final PartTwoTwoStaus partTwoTwoStaus;
  final String? error;

  const PartTwoTwoState({
    required this.partTwoTwoStaus,
    this.error,
  });

  factory PartTwoTwoState.initial() {
    return PartTwoTwoState(partTwoTwoStaus: PartTwoTwoStaus.intial);
  }

  PartTwoTwoState copyWith({
    final PartTwoTwoStaus? partTwoOneStaus,
    final String? error,
    final PartTwoOneModel? partTwoOneModel,
  }) {
    return PartTwoTwoState(
      partTwoTwoStaus: partTwoOneStaus ?? this.partTwoTwoStaus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [error, partTwoTwoStaus];
}
