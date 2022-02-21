import 'package:flutter/material.dart';
import 'package:ioasys_pokedex/app/controllers/description_controller.dart';
import 'package:ioasys_pokedex/app/core/theme/theme.dart';
import 'package:ioasys_pokedex/app/models/description_model.dart';
import 'package:ioasys_pokedex/app/models/pokemon_model.dart';
import 'package:ioasys_pokedex/app/pages/details/Widgets/base_stats_widget.dart';
import 'package:ioasys_pokedex/app/pages/details/Widgets/characteristics_widget.dart';
import 'package:ioasys_pokedex/app/repositories/description_repository.dart';
import 'package:ioasys_pokedex/app/services/dio_service.dart';
import 'package:ioasys_pokedex/app/utils/string_first_letter.dart';

class DetailsCardWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailsCardWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DescriptionController _controller = DescriptionController(
      DescriptionRepository(DioService()),
      pokemon.id,
    );

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(height: 44),
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
                      pokemon.types[index].type.name.toFirstLetterCase(),
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
          ValueListenableBuilder<Description?>(
            valueListenable: _controller.description,
            builder: (_, description, __) {
              return description != null
                  ? Text(
                      description.flavorTextEntries!.first.flavorText
                          .toString()
                          .replaceAll('\n', ' ')
                          .replaceAll('\f', ' '),
                      style: TextStyle(
                        color: AppTheme.darkGray,
                        fontSize: 14,
                      ),
                    )
                  : CircularProgressIndicator();
            },
          ),
          const SizedBox(height: 24),
          BaseStatsWidget(pokemon: pokemon),
        ],
      ),
    );
  }
}
