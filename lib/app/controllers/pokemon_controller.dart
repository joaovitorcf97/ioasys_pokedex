import 'package:flutter/material.dart';

import '../models/pokemon_model.dart';
import '../repositories/pokemon_repository.dart';

class PokemonController {
  final PokemonRepository _pokemonRepository;
  final String name;

  PokemonController(this._pokemonRepository, this.name) {
    fetch();
  }

  ValueNotifier<PokemonModel?> pokemon = ValueNotifier<PokemonModel?>(null);

  fetch() async {
    pokemon.value = await _pokemonRepository.getPokemon(name);
  }
}
