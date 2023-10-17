import 'package:app_creative_val/src/domain/models/pokemon_model.dart';
import 'package:app_creative_val/src/presentation/cubit/pokemon/pokemon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<dynamic> _pokemonList = [];
  @override
  void initState() {
    // TODO: implement initState
    context.read<PokemonCubit>().getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoaded) {
            return ListView.builder(
              itemCount: state.pokemonList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.pokemonList[index]['name']),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Welcome to the Home Page!',
                    style: TextStyle(fontSize: 24),
                  ),
                  // Puedes agregar más contenido de la página de inicio aquí
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
