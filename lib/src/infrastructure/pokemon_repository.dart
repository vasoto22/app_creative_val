import 'dart:convert';
import 'package:app_creative_val/src/domain/models/pokedex_model.dart';
import 'package:http/http.dart' as http;

import 'package:app_creative_val/src/domain/interfaces/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final urlBase =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  @override
  Future<Pokedex> getPokemons() async {
    final response = await http.get(Uri.parse(urlBase));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final pokedex = Pokedex.fromJson(jsonData);
      return pokedex;
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }
}
