import 'dart:convert';

class ExerciseModel {
  final String video;
  final String name;
  final String method;
  final int series;
  final int repetitions;
  final int load;
  final int interval;
  final List<int> cadence;
  final int volume;
  final String zone;
  final String pace;

  ExerciseModel({
    required this.video,
    required this.name,
    required this.method,
    this.series = 0,
    this.repetitions = 0,
    this.load = 0,
    this.interval = 0,
    this.cadence = const [],
    this.volume = 0,
    this.zone = '',
    this.pace = '',
  });

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      video: map['video'] ?? '',
      name: map['name'] ?? '',
      method: map['method'] ?? '',
      series: map['series'] ?? 0,
      repetitions: map['repetitions'] ?? 0,
      load: map['load'] is String
          ? map['load'] == '-' || map['load'].isEmpty
              ? 0
              : int.parse(map['load'])
          : map['load'] ?? 0,
      interval: map['interval'] ?? 0,
      cadence: map['cadence'] != null ? List<int>.from(map['cadence']) : [],
      volume: map['VOLUME'] ?? 0,
      zone: map['ZONA'] ?? '',
      pace: map['RITMO'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'VÍDEO': video,
      'EXERCÍCIOS': name,
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

  factory ExerciseModel.fromJson(String source) =>
      ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
