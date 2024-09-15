import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/utils/exception.dart';
import '../../models/workout_model.dart';
import 'google_sheets_service.dart';

class GoogleSheetsServiceImpl implements GoogleSheetsService {
  final _baseUrl = const String.fromEnvironment('API_URL');
  final String spreadSheetName;

  GoogleSheetsServiceImpl({
    required this.spreadSheetName,
  });

  @override
  Future<List<WorkoutModel>> getWorkouts() async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl?spreadsheetName=$spreadSheetName',
        ),
      );

      final workouts = jsonDecode(response.body);
      final workoutList = <WorkoutModel>[];

      if (workouts is List) {
        for (final workout in workouts) {
          workoutList.add(WorkoutModel.fromMap(workout));
        }
      }

      return workoutList;
    } catch (e) {
      throw GoogleSheetGetException(error: e);
    }
  }

  @override
  Future<void> updateWorkouts(WorkoutModel workout) async {
    try {
      await http.post(
        Uri.parse('$_baseUrl?spreadsheetName=$spreadSheetName'),
        headers: {'Content-Type': 'application/json'},
        body: workout.toJson(),
      );
    } catch (e) {
      GoogleSheetGetException(error: e);
    }
  }
}
