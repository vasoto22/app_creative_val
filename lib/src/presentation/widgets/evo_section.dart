import 'package:flutter/material.dart';
import 'package:app_creative_val/src/domain/models/pokemon_model.dart';

class EvoSection extends StatelessWidget {
  final Pokemon pokemonDetail;
  final double width;
  final double height;

  EvoSection(
      {required this.pokemonDetail, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: width * 0.3,
            child: Text(
              'Next Evolution',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            child: pokemonDetail.nextEvolution.isNotEmpty
                ? SizedBox(
                    height: height * 0.03,
                    width: width * 0.55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pokemonDetail.nextEvolution.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            pokemonDetail.nextEvolution[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Text(
                    "Maxed Out",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
