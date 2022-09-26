part of 'bsc_code_bloc.dart';

enum BscCodeStaus { intial, loading, successful, error }

class BscCodeState extends Equatable {
  final BscCodeStaus bscCodeStaus;
  final String? error;
  final BscCodeModel? bscCodeModel;

  const BscCodeState(
      {required this.bscCodeStaus, this.error, this.bscCodeModel});

  factory BscCodeState.initial() {
    return BscCodeState(bscCodeStaus: BscCodeStaus.intial);
  }

  BscCodeState copyWith({
    final BscCodeStaus? bscCodeStaus,
    final String? error,
    final BscCodeModel? bscCodeModel,
  }) {
    return BscCodeState(
      bscCodeStaus: bscCodeStaus ?? this.bscCodeStaus,
      error: error ?? this.error,
      bscCodeModel: bscCodeModel ?? this.bscCodeModel,
    );
  }

  @override
  List<Object?> get props => [bscCodeModel, error, bscCodeStaus];
}
