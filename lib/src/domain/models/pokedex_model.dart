import 'package:app_creative_val/src/domain/models/pokemon_model.dart';

class Pokedex {
  late List<Pokemon> pokemon;

  Pokedex({required this.pokemon});

  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((v) {
        pokemon.add(Pokemon.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pokemon.isNotEmpty) {
      data['pokemon'] = pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
