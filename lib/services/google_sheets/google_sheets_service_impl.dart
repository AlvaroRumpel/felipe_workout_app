import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/utils/exception.dart';
import '../../models/exercise_model.dart';
import '../../models/workout_model.dart';
import 'google_sheets_service.dart';

class GoogleSheetsServiceImpl implements GoogleSheetsService {
  final _baseUrl = const String.fromEnvironment('API_URL');
  final String email;

  GoogleSheetsServiceImpl({
    required this.email,
  });

  @override
  Future<List<WorkoutModel>> getWorkouts() async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl?email=$email',
        ),
      );

      final workouts = jsonDecode(response.body);
      var workoutList = <WorkoutModel>[];

      if (workouts is Map) {
        for (final item in workouts.entries) {
          final name = item.key;
          final exerciseList = <ExerciseModel>[];

          if (item.value is List) {
            for (final exercise in item.value) {
              final exerciseModel = ExerciseModel.fromMap(exercise);
              exerciseList.add(exerciseModel);
            }

            if (item.value.isNotEmpty) {
              workoutList.add(
                WorkoutModel(name: name, exercises: exerciseList),
              );
            }
          }
        }
      }

      return workoutList;
    } catch (e) {
      throw GoogleSheetGetException(error: e);
    }
  }

  @override
  Future<void> updateWorkouts(ExerciseModel workout) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl?email=$email'),
        headers: {'Content-Type': 'application/json'},
        body: workout.toJson(),
      );
    } catch (e) {
      GoogleSheetGetException(error: e);
    }
  }
}
