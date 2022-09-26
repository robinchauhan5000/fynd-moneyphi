import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoOneModel.dart';

import '../../../../controller/PanVerificationRepo.dart';

part 'part_two_one_state.dart';

class PartTwoOneCubit extends Cubit<PartTwoOneState> {
  PanVerificationRepo _panVerificationRepo;
  PartTwoOneCubit({required PanVerificationRepo panVerificationRepo})
      : _panVerificationRepo = panVerificationRepo,
        super(PartTwoOneState.initial());

  postPartTwoOneKyc(PartTwoOneModel partTwoOneModel) async {
    try {
      emit(state.copyWith(partTwoOneStaus: PartTwoOneStaus.loading));
      var fetch = await _panVerificationRepo.submitPartTwoOne(
          partTwoOneModel: partTwoOneModel);

      if (fetch['onborading'] == true) {
        emit(state.copyWith(partTwoOneStaus: PartTwoOneStaus.successful));
      } else {
        emit(state.copyWith(
            error: fetch['message'], partTwoOneStaus: PartTwoOneStaus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), partTwoOneStaus: PartTwoOneStaus.error));
    }
  }
}
