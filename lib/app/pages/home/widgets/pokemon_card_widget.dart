import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';
import 'package:ioasys_pokedex/app/models/pokemon_model.dart';
import 'package:ioasys_pokedex/app/pages/details/details_page.dart';

import '../../../utils/api.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCardWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsPage(pokemon: pokemon),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: AppTheme.color(type: pokemon.types.first.type.name)!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 4),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  '#${pokemon.id.toString().padLeft(3, '0')}',
                  style: TextStyle(
                    fontSize: 8,
                    color: AppTheme.color(type: pokemon.types.first.type.name)!,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 72,
              height: 72,
              child: Hero(
                tag: pokemon.id,
                child: SvgPicture.network(
                  API.REQUEST_POKEMON_IMG(pokemon.id),
                  placeholderBuilder: ((context) {
                    return Container(
                        padding: const EdgeInsets.all(16),
                        child: const CircularProgressIndicator());
                  }),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppTheme.white,
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 24,
              decoration: BoxDecoration(
                color: AppTheme.color(type: pokemon.types.first.type.name),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
