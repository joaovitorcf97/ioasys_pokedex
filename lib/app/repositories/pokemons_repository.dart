import 'package:ioasys_pokedex/app/services/dio_service.dart';

import '../models/pokemons_model.dart';
import '../utils/api.dart';

abstract class IPokemonsRepository {
  Future<PokemonsModel> getAllPokemons();
}

class PokemonsRepository implements IPokemonsRepository {
  final DioService _dioService;

  PokemonsRepository(this._dioService);

  @override
  Future<PokemonsModel> getAllPokemons() async {
    var result = await _dioService.getDio().get(API.REQUEST_POKEMONS_LIST);

    return PokemonsModel.fromJson(result.data);
  }
}
