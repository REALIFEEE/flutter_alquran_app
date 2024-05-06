import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ahlul_quran_app/data/model/detailsurah.dart';
import 'package:flutter_ahlul_quran_app/data/serviceApi.dart';

part 'ayat_state.dart';

class AyatCubit extends Cubit<AyatState> {
  AyatCubit(this.apiService) : super(AyatInitial());

  final ApiService apiService;

  void getDetailSurah(int AmmountSurah) async {
    emit(ayatLoading());
    final result = await apiService.getDetailSurah(AmmountSurah);

    result.fold(
        (l) => emit(AyatError(message: l)), (r) => emit(AyatLoaded(detail: r)));
  }
}
