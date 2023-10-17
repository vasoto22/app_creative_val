part of 'pokemon_cubit.dart';

class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

final class PokemonInitial extends PokemonState {}

final class PokemonLoading extends PokemonState {
  final bool isLoading;

  PokemonLoading({required this.isLoading});
}

final class PokemonLoaded extends PokemonState {
  final List<dynamic> pokemonList;

  PokemonLoaded({required this.pokemonList});
}

final class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});
}
