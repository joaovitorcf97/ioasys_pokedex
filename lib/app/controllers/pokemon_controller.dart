import 'package:flutter/cupertino.dart';
import 'package:ioasys_pokedex/app/models/pokemons_model.dart';

import '../repositories/pokemons_repository.dart';

class PokemonController {
  final PokemonsRepository _pokemonRepository;

  PokemonController(this._pokemonRepository) {
    fetch();
  }

  ValueNotifier<PokemonsModel?> pokemons = ValueNotifier<PokemonsModel?>(null);

  fetch() async {
    pokemons.value = await _pokemonRepository.getAllPokemons();
  }
}
