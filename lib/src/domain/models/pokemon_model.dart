import 'package:app_creative_val/src/domain/models/next_evolution_model.dart';

class Pokemon {
  late int id;
  late String num;
  late String name;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  late String candy;
  late int candyCount;
  late String egg;
  late double spawnChance;
  late double avgSpawns;
  late String spawnTime;
  late List<double> multipliers;
  late List<String> weaknesses;
  late List<NextEvolution> nextEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    num = json['num'] ?? '';
    name = json['name'] ?? '';
    img = json['img'] ?? '';
    type = List<String>.from(json['type'] ?? []);
    height = json['height'] ?? '';
    weight = json['weight'] ?? '';
    candy = json['candy'] ?? '';
    candyCount = json['candy_count'] ?? 0;
    egg = json['egg'] ?? '';
    spawnChance = json['spawn_chance'] is int
        ? (json['spawn_chance'] as int).toDouble()
        : (json['spawn_chance'] as double?) ?? 0.0;
    avgSpawns = json['avg_spawns'] is int
        ? (json['avg_spawns'] as int).toDouble()
        : (json['avg_spawns'] as double?) ?? 0.0;
    spawnTime = json['spawn_time'] ?? '';
    multipliers = List<double>.from(json['multipliers'] ?? []);
    weaknesses = List<String>.from(json['weaknesses'] ?? []);
    if (json['next_evolution'] != null) {
      nextEvolution = List<NextEvolution>.from(
          json['next_evolution'].map((x) => NextEvolution.fromJson(x)));
    } else {
      nextEvolution = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['candy_count'] = candyCount;
    data['egg'] = egg;
    data['spawn_chance'] = spawnChance;
    data['avg_spawns'] = avgSpawns;
    data['spawn_time'] = spawnTime;
    data['multipliers'] = multipliers;
    data['weaknesses'] = weaknesses;
    if (nextEvolution.isNotEmpty) {
      data['next_evolution'] =
          List<dynamic>.from(nextEvolution.map((x) => x.toJson()));
    }
    return data;
  }
}
