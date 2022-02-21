import '../models/pokemon_model.dart';
import '../services/dio_service.dart';
import '../utils/api.dart';

abstract class IPokemonRepository {
  Future<PokemonModel> getPokemon(String name);
}

class PokemonRepository implements IPokemonRepository {
  final DioService _dioService;

  PokemonRepository(this._dioService);

  @override
  Future<PokemonModel> getPokemon(String name) async {
    var result = await _dioService.getDio().get(API.REQUEST_POKEMON(name));

    return PokemonModel.fromJson(result.data);
  }
}
