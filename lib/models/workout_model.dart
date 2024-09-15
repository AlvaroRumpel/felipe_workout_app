import 'dart:convert';

class WorkoutModel {
  final String video;
  final String exercise;
  final String method;
  final int series;
  final int repetitions;
  final int load;
  final int interval;
  final int cadence;
  final int volume;
  final String zone;
  final String pace;

  WorkoutModel({
    required this.video,
    required this.exercise,
    required this.method,
    this.series = 0,
    this.repetitions = 0,
    this.load = 0,
    this.interval = 0,
    this.cadence = 0,
    this.volume = 0,
    this.zone = '',
    this.pace = '',
  });

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      video: map['VÍDEO'] ?? '',
      exercise: map['EXERCÍCIOS'] ?? '',
      method: map['MÉTODO'] ?? '',
      series: map['SÉRIES'] ?? 0,
      repetitions: map['REPETIÇÕES'] ?? 0,
      load: map['CARGA'] ?? 0,
      interval: map['INTERVALO'] ?? 0,
      cadence: map['CADÊNCIA'] ?? 0,
      volume: map['VOLUME'] ?? 0,
      zone: map['ZONA'] ?? '',
      pace: map['RITMO'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'VÍDEO': video,
      'EXERCÍCIOS': exercise,
      'MÉTODO': method,
      'SÉRIES': series,
      'REPETIÇÕES': repetitions,
      'CARGA': load,
      'INTERVALO': interval,
      'CADÊNCIA': cadence,
      'VOLUME': volume,
      'ZONA': zone,
      'RITMO': pace,
    };
  }

  String toJson() => json.encode(toMap());

  factory WorkoutModel.fromJson(String source) =>
      WorkoutModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
