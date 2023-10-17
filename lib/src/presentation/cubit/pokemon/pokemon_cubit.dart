import 'package:app_creative_val/src/domain/interfaces/pokemon_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository pokemonRepository;
  PokemonCubit(this.pokemonRepository) : super(PokemonInitial());

  void getAllPokemons() async {
    try {
      final List<dynamic> pokemonList = await pokemonRepository.getPokemons();
      final bool isLoading = pokemonList.isNotEmpty;
      emit(PokemonLoading(isLoading: isLoading));
      await Future.delayed(Duration(seconds: 2));
      emit(PokemonLoaded(pokemonList: pokemonList));
    } catch (e) {
      emit(PokemonError(message: e.toString()));
    }
  }
}
