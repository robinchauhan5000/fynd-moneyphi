import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneyphi/Model/KycFormModel/PartTwoOneModel.dart';

import '../../../../Model/KycFormModel/PartTwoTwoModel.dart';
import '../../../../controller/PanVerificationRepo.dart';

part 'part_two_two_state.dart';

class PartTwoTwoCubit extends Cubit<PartTwoTwoState> {
  PanVerificationRepo _panVerificationRepo;
  PartTwoTwoCubit({required PanVerificationRepo panVerificationRepo})
      : _panVerificationRepo = panVerificationRepo,
        super(PartTwoTwoState.initial());

  postPartTwoOneKyc(PartTwoTwoModel partTwoTwoModel) async {
    try {
      emit(state.copyWith(partTwoOneStaus: PartTwoTwoStaus.loading));
      var fetch = await _panVerificationRepo.partTwoTwo(
          partTwoTwoModel: partTwoTwoModel);

      if (fetch['onborading'] == true) {
        emit(state.copyWith(partTwoOneStaus: PartTwoTwoStaus.successful));
      } else {
        emit(state.copyWith(
            error: fetch['message'], partTwoOneStaus: PartTwoTwoStaus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), partTwoOneStaus: PartTwoTwoStaus.error));
    }
  }
}
