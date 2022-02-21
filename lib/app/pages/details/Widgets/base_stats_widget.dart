import 'package:flutter/material.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';
import 'package:ioasys_pokedex/app/utils/stats_names.dart';

import '../../../models/pokemon_model.dart';

class BaseStatsWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const BaseStatsWidget({Key? key, required this.pokemon}) : super(key: key);

  percentage(partialValue, totalValue) {
    return ((100 * partialValue) / totalValue) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Base Stats',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppTheme.color(type: pokemon.types.first.type.name),
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          itemCount: pokemon.stats.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Row(
              children: [
                SizedBox(
                  width: 47,
                  child: Text(
                    StatsNames.statName(
                      stat: pokemon.stats[index].stat.name.toLowerCase(),
                    ).toString().toUpperCase(),
                    style: TextStyle(
                      color: AppTheme.color(
                        type: pokemon.types.first.type.name,
                      ),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 21,
                  color: AppTheme.lightGray,
                ),
                SizedBox(
                  width: 50,
                  child: Center(
                    child: Text(
                      pokemon.stats[index].baseStat.toString().padLeft(3, '0'),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: percentage(pokemon.stats[index].baseStat, 255),
                    minHeight: 6,
                    backgroundColor:
                        AppTheme.color(type: pokemon.types.first.type.name)!
                            .withOpacity(.2),
                    valueColor: AlwaysStoppedAnimation<Color?>(
                      AppTheme.color(type: pokemon.types.first.type.name),
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
