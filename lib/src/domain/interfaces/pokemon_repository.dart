import 'package:app_creative_val/src/domain/models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<dynamic>> getPokemons();
}
