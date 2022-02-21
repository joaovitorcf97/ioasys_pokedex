import 'package:flutter/material.dart';
import 'package:ioasys_pokedex/app/controllers/pokemon_controller.dart';
import 'package:ioasys_pokedex/app/controllers/pokemons_controller.dart';
import 'package:ioasys_pokedex/app/models/pokemon_model.dart';
import 'package:ioasys_pokedex/app/models/pokemons_model.dart';
import 'package:ioasys_pokedex/app/pages/home/widgets/pokemon_card_widget.dart';
import 'package:ioasys_pokedex/app/repositories/pokemon_repository.dart';
import 'package:ioasys_pokedex/app/repositories/pokemons_repository.dart';
import 'package:ioasys_pokedex/app/services/dio_service.dart';
import 'package:ioasys_pokedex/app/widgets/title_widget.dart';
import '../../core/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonsController _controller = PokemonsController(
    PokemonsRepository(
      DioService(),
    ),
  );

  FocusNode _focus = FocusNode();
  final TextEditingController _controllerTextFild = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 16,
                  color: AppTheme.pink,
                ),
                const TitleWidget(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: SizedBox(
                    height: 54,
                    child: TextField(
                      focusNode: _focus,
                      controller: _controllerTextFild,
                      onChanged: _controller.onchanged,
                      decoration: InputDecoration(
                        hintText: 'Buscar pokemon',
                        labelText: 'Buscar',
                        suffixIcon: _focus.hasFocus == true
                            ? IconButton(
                                onPressed: () {
                                  _controllerTextFild.clear();
                                  _controller.onchanged('');
                                  setState(() {});
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : Icon(Icons.search),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppTheme.pink),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppTheme.pink),
                        ),
                      ),
                    ),
                  ),
                ),
                ValueListenableBuilder<PokemonsModel?>(
                  valueListenable: _controller.pokemons,
                  builder: (_, pokemons, __) {
                    return pokemons != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              children: List.generate(
                                pokemons.results!.length,
                                (index) {
                                  final PokemonController _pokemonController =
                                      PokemonController(
                                          PokemonRepository(
                                            DioService(),
                                          ),
                                          pokemons.results![index].name
                                              .toString()
                                              .toLowerCase());
                                  return ValueListenableBuilder<PokemonModel?>(
                                    valueListenable: _pokemonController.pokemon,
                                    builder: (_, pokemon, __) {
                                      return pokemon != null
                                          ? PokemonCardWidget(pokemon: pokemon)
                                          : const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                    },
                                  );
                                },
                              ),
                              //
                            ),
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
