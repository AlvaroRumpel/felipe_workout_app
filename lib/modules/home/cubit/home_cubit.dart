import 'package:flutter/material.dart';

import '../../../core/utils/emit_catch.dart';
import '../../../models/workout_model.dart';
import '../../../services/google_sheets/google_sheets_service.dart';

part 'home_state.dart';

class HomeCubit extends FWCubit<HomeState> {
  final GoogleSheetsService _googleSheetsService;
  HomeCubit({
    required GoogleSheetsService googleSheetsService,
  })  : _googleSheetsService = googleSheetsService,
        super(HomeInitial()) {
    getWorkouts();
  }

  Future<void> getWorkouts() async {
    await emitCatch(
      loading: HomeLoading(),
      success: () async {
        final result = await _googleSheetsService.getWorkouts();
        return result.isNotEmpty ? HomeData(workouts: result) : HomeEmpty();
      },
      error: (err) => HomeError(message: err.toString()),
    );
  }
}
