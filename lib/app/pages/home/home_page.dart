import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ioasys_pokedex/app/controllers/pokemon_controller.dart';
import 'package:ioasys_pokedex/app/models/pokemons_model.dart';
import 'package:ioasys_pokedex/app/pages/home/widgets/pokemon_card_widget.dart';
import 'package:ioasys_pokedex/app/repositories/pokemons_repository.dart';
import 'package:ioasys_pokedex/app/services/dio_service.dart';

import '../../utils/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonController _controller = PokemonController(
    PokemonsRepository(
      DioService(),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ioasys pokédex'),
            ValueListenableBuilder<PokemonsModel?>(
              valueListenable: _controller.pokemons,
              builder: (_, pokemons, __) {
                return pokemons != null
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,

                            children: List.generate(
                              pokemons.results!.length,
                              (index) {
                                return PokemonCardWidget(
                                  index: index,
                                  imageId: index,
                                  name:
                                      pokemons.results![index].name.toString(),
                                );
                              },
                            ),
                            //
                          ),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
