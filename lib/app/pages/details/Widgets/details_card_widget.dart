import 'package:flutter/material.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';
import 'package:ioasys_pokedex/app/models/pokemon_model.dart';
import 'package:ioasys_pokedex/app/pages/details/Widgets/base_stats_widget.dart';
import 'package:ioasys_pokedex/app/pages/details/Widgets/characteristics_widget.dart';

class DetailsCardWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailsCardWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 32,
                color: AppTheme.pink,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              itemCount: pokemon.types.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppTheme.color(
                      type: pokemon.types[index].type.name,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      pokemon.types[index].type.name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          CharacteristicsWidget(pokemon: pokemon),
          const SizedBox(height: 24),
          Text(
            'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
            style: TextStyle(
              color: AppTheme.darkGray,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          BaseStatsWidget(pokemon: pokemon),
        ],
      ),
    );
  }
}
