import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../controller/PanVerificationRepo.dart';

part 'part_five_state.dart';

class PartFiveCubit extends Cubit<PartFiveState> {
  PanVerificationRepo _panVerificationRepo;
  PartFiveCubit({required PanVerificationRepo panVerificationRepo})
      : _panVerificationRepo = panVerificationRepo,
        super(PartFiveState.initial());

  postPartTwoFive() async {
    try {
      emit(state.copyWith(partTwoOneStaus: PartTwoFiveStaus.loading));
      var fetch = await _panVerificationRepo.partTwoFive();

      print('fetch');
      print(fetch['success']);
      if (fetch['success'] == true) {
        emit(state.copyWith(partTwoOneStaus: PartTwoFiveStaus.successful));
      } else {
        emit(state.copyWith(
            error: fetch['message'], partTwoOneStaus: PartTwoFiveStaus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), partTwoOneStaus: PartTwoFiveStaus.error));
    }
  }
}
