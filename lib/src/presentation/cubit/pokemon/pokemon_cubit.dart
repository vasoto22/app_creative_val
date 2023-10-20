import 'package:app_creative_val/src/domain/interfaces/pokemon_repository.dart';
import 'package:app_creative_val/src/domain/models/pokedex_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository pokemonRepository;
  PokemonCubit(this.pokemonRepository) : super(PokemonInitial());

  void getAllPokemons() async {
    try {
      emit(PokemonLoading(isLoading: true));

      final Pokedex pokemonList = await pokemonRepository.getPokemons();
      if (pokemonList.pokemon.isNotEmpty) {
        emit(PokemonLoading(isLoading: false));
        emit(PokemonLoaded(pokemonList: pokemonList.pokemon));
      } else {
        emit(PokemonLoading(isLoading: false));
        emit(PokemonEmpty());
      }
    } catch (e) {
      emit(PokemonError(message: e.toString()));
    }
  }
}
