import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';
import 'package:ioasys_pokedex/app/pages/details/Widgets/details_card_widget.dart';
import 'package:ioasys_pokedex/app/utils/string_first_letter.dart';

import '../../models/pokemon_model.dart';
import '../../utils/api.dart';

class DetailsPage extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailsPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.color(type: pokemon.types.first.type.name),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon.name.toFirstLetterCase(),
              style: const TextStyle(
                color: AppTheme.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            Text(
              '#${pokemon.id.toString().padLeft(3, '0')}',
              style: const TextStyle(
                color: AppTheme.white,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: 160),
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                DetailsCardWidget(pokemon: pokemon),
                Positioned(
                  top: -160,
                  left: 180,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: SvgPicture.asset(
                      'assets/images/pokeball.svg',
                    ),
                  ),
                ),
                Positioned(
                  top: -125,
                  left: 90,
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Hero(
                      tag: pokemon.id,
                      child: SvgPicture.network(
                        API.REQUEST_POKEMON_IMG(pokemon.id),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
