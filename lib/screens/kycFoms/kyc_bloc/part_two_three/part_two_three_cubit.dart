import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../Model/KycFormModel/PartTwoThreeModel.dart';
import '../../../../controller/PanVerificationRepo.dart';

part 'part_two_three_state.dart';

class PartTwoThreeCubit extends Cubit<PartTwoThreeState> {
  PanVerificationRepo _panVerificationRepo;
  PartTwoThreeCubit({required PanVerificationRepo panVerificationRepo})
      : _panVerificationRepo = panVerificationRepo,
        super(PartTwoThreeState.initial());

  postPartTwoOneKyc(PartTwoThreeModel partTwoThreeModel) async {
    print(partTwoThreeModel.nomineeName);
    print(partTwoThreeModel.nomineeDob);
    print(partTwoThreeModel.nomineeRelation);
    print(partTwoThreeModel.nomineeGuardian);
    try {
      emit(state.copyWith(partTwoThreeStaus: PartTwoThreeStaus.loading));

      var fetch = await _panVerificationRepo.partTwoThree(
          partTwoThreeModel: partTwoThreeModel);

      if (fetch['onborading'] == true) {
        emit(state.copyWith(partTwoThreeStaus: PartTwoThreeStaus.successful));
      } else {
        emit(state.copyWith(
            error: fetch['message'],
            partTwoThreeStaus: PartTwoThreeStaus.error));
      }
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(), partTwoThreeStaus: PartTwoThreeStaus.error));
    }
  }
}
