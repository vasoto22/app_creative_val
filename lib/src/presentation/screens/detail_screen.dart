import 'package:app_creative_val/src/presentation/widgets/arrow_back_button.dart';
import 'package:app_creative_val/src/presentation/widgets/image_widget.dart';
import 'package:app_creative_val/src/presentation/widgets/info_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final heroTag;
  final pokemonDetail;
  final Color color;

  const DetailScreen(
      {Key? key, this.heroTag, this.pokemonDetail, required this.color})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const ArrowBack(),
          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pokemonDetail.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.pokemonDetail.num,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Positioned(
              top: 110,
              left: 22,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.pokemonDetail.type.join(", "),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
              )),
          Positioned(
            top: height * 0.18,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    InfoRow(label: 'Name', value: widget.pokemonDetail.name),
                    InfoRow(
                        label: 'Height', value: widget.pokemonDetail.height),
                    InfoRow(
                        label: 'Weight', value: widget.pokemonDetail.weight),
                    InfoRow(
                        label: 'Spawn Time',
                        value: widget.pokemonDetail.spawnTime),
                    InfoRow(
                        label: 'Weakness',
                        value: widget.pokemonDetail.weaknesses.join(", ")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: const Text(
                              'Next Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child: widget.pokemonDetail.nextEvolution != null
                                  ? SizedBox(
                                      height: 20,
                                      width: width * 0.55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget
                                            .pokemonDetail.nextEvolution.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              widget.pokemonDetail
                                                  .nextEvolution[index].name,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Text(
                                      "Maxed Out",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.2),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    height: 200,
                    width: 200,
                    imageUrl: widget.pokemonDetail.img,
                    fit: BoxFit.cover,
                  ),
                  ImageWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
