import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Model/BscCodeDataModel.dart';
import '../../../controller/BscCodeRepo.dart';

part 'bsc_code_event.dart';
part 'bsc_code_state.dart';

class BscCodeBloc extends Bloc<BscCodeEvent, BscCodeState> {
  final BscCodeRepo _bscCodeRepo;
  BscCodeBloc({required BscCodeRepo bscCodeRepo})
      : _bscCodeRepo = bscCodeRepo,
        super(BscCodeState.initial()) {
    on<BscCodeFetch>((event, emit) async {
      try {
        emit(state.copyWith(bscCodeStaus: BscCodeStaus.loading));

        var response = await _bscCodeRepo.getAllData();
        print("from bloc222  ${response["success"]}");
        if (response["success"]) {
          BscCodeModel data = BscCodeModel.fromJson(response);
          print("from bloc ${data}");
          emit(state.copyWith(
              bscCodeModel: data, bscCodeStaus: BscCodeStaus.successful));
        } else {
          emit(state.copyWith(
              bscCodeStaus: BscCodeStaus.error, error: response['success']));
        }
      } catch (e) {
        emit(state.copyWith(
            bscCodeStaus: BscCodeStaus.error, error: e.toString()));
      }
    });
  }
}
