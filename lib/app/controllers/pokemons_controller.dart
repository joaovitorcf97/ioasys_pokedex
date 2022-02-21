import 'package:flutter/cupertino.dart';
import 'package:ioasys_pokedex/app/models/pokemons_model.dart';

import '../repositories/pokemons_repository.dart';

class PokemonsController {
  final PokemonsRepository _pokemonsRepository;

  PokemonsController(this._pokemonsRepository) {
    fetch();
  }

  ValueNotifier<PokemonsModel?> pokemons = ValueNotifier<PokemonsModel?>(null);
  PokemonsModel? _cachedPokemons;

  onchanged(String value) {
    List<Results> list = _cachedPokemons!.results!
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();

    pokemons.value = pokemons.value!.copyWith(results: list);
  }

  fetch() async {
    pokemons.value = await _pokemonsRepository.getAllPokemons();
    _cachedPokemons = pokemons.value;
  }
}
