import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/theme.dart';
import '../../../models/pokemon_model.dart';

class CharacteristicsWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const CharacteristicsWidget({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('0,0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/images/icon_weight.svg'),
                const SizedBox(width: 8),
                Text(
                  '${formatter.format(pokemon.weight)} kg',
                  style: const TextStyle(
                    color: AppTheme.darkGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Weight',
              style: TextStyle(
                color: AppTheme.textGray,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/images/icon_height.svg'),
                const SizedBox(width: 8),
                Text(
                  '${formatter.format(pokemon.height)} m',
                  style: const TextStyle(
                    color: AppTheme.darkGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Weight',
              style: TextStyle(
                color: AppTheme.textGray,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 120,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: pokemon.abilities.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Center(
                      child: Text(pokemon.abilities[index].ability.name));
                },
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Moves',
              style: TextStyle(
                color: AppTheme.textGray,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
