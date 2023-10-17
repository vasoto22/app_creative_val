import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_creative_val/src/domain/interfaces/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final urlBase =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  @override
  Future<List<dynamic>> getPokemons() async {
    final response = await http.get(Uri.parse(urlBase));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['results']);
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Failed to load pokemon list');
    }
  }
}
