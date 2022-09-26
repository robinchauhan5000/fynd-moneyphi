import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:moneyphi/Model/PanVerificationModel.dart';
import 'package:moneyphi/controller/PanVerificationRepo.dart';

part 'pan_kycverification_state.dart';

class PanKycverificationCubit extends Cubit<PanKycverificationState> {
  PanVerificationRepo _panVerificationRepo;
  PanKycverificationCubit({required PanVerificationRepo panVerificationRepo})
      : _panVerificationRepo = panVerificationRepo,
        super(PanKycverificationState.initial());

  checkKyc({String? panNumber}) async {
    try {
      emit(state.copyWith(panVerificationStaus: PanVerificationStaus.Loading));
      var fetch = await _panVerificationRepo.checkKycWithVerification(
          panNumber: panNumber!);

      if (fetch['success'] == true) {
        var data = PanVerificationModel.fromJson(fetch);
        emit(state.copyWith(
            panVerificationModel: data,
            panVerificationStaus: PanVerificationStaus.Completed));
      } else {
        emit(state.copyWith(
            errorMessage: fetch['message'],
            panVerificationStaus: PanVerificationStaus.Error));
      }
    } catch (e) {
      emit(state.copyWith(
          errorMessage: e.toString(),
          panVerificationStaus: PanVerificationStaus.Error));
    }
  }
}
