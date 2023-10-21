import 'package:app_creative_val/src/domain/models/pokemon_model.dart';
import 'package:app_creative_val/src/presentation/cubit/pokemon/pokemon_cubit.dart';
import 'package:app_creative_val/src/presentation/screens/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // Iniciar la carga de los Pokémon en el initState
    context.read<PokemonCubit>().getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Color _greenColor = Color(0xff2a9d8f);
    Color _redColor = Color(0xffe76f51);
    Color _blueColor = Color(0xff37A5C6);

    return Scaffold(
      // backgroundColor: Colors
      //     .transparent, // Establece el fondo del Scaffold como transparente.
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'assets/images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
              top: 60,
              left: 20,
              child: Text(
                'Poke Oke',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Positioned(
            top: 150,
            bottom: 0,
            width: width, // Alinea el contenido debajo del espacio en blanco
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<PokemonCubit, PokemonState>(
                    builder: (context, state) {
                      if (state is PokemonLoading) {
                        return _buildLoading();
                      } else if (state is PokemonLoaded) {
                        final pokemonList = state.pokemonList;
                        return _buildPokemonList(pokemonList);
                      } else if (state is PokemonEmpty) {
                        return Center(
                          child: Text('No hay Pokémon disponibles.'),
                        );
                      } else if (state is PokemonError) {
                        return _buildError(state.message);
                      } else {
                        return _buildUnknownError();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildPokemonList(List<dynamic> pokemonList) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
      ),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: InkWell(
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: getColorForType(pokemonList[index].type),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: Image.asset(
                        'assets/images/pokeball.png',
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Hero(
                        tag: index,
                        child: CachedNetworkImage(
                          imageUrl: pokemonList[index].img,
                          height: 100,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => Center(
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 15,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text(
                            pokemonList[index].type[0],
                            style: const TextStyle(
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(0, 0),
                                  spreadRadius: 1.0,
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 15,
                      child: Text(
                        pokemonList[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(0, 0),
                              spreadRadius: 1.0,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(
                    heroTag: index,
                    pokemonDetail: pokemonList[index],
                    color: getColorForType(pokemonList[index].type),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Color getColorForType(List<String> types) {
    if (types.isEmpty) {
      return Colors
          .pink; // Color predeterminado si la lista de tipos está vacía
    }
    // Aquí puedes seleccionar un tipo específico de la lista de tipos
    String primaryType = types[0];

    switch (primaryType) {
      case "Grass":
        return Colors.greenAccent;
      case "Fire":
        return Colors.redAccent;
      case "Water":
        return Colors.blue;
      case "Poison":
        return Colors.deepPurpleAccent;
      case "Electric":
        return Colors.amber;
      case "Rock":
        return Colors.grey;
      case "Ground":
        return Colors.brown;
      case "Psychic":
        return Colors.indigo;
      case "Fighting":
        return Colors.orange;
      case "Bug":
        return Colors.lightGreenAccent;
      case "Ghost":
        return Colors.deepPurple;
      case "Normal":
        return Colors.black26;
      default:
        return Colors.pink;
    }
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Error cargando la lista de Pokémon',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildUnknownError() {
    return const Center(
      child: Text('Estado desconocido. Revisa el código del cubit.'),
    );
  }
}
