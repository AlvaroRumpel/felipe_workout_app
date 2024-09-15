import '../../models/workout_model.dart';

export 'google_sheets_service_impl.dart';

abstract interface class GoogleSheetsService {
  Future<List<WorkoutModel>> getWorkouts();
  Future<void> updateWorkouts(WorkoutModel workout);
}
