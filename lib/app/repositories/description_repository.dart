import 'package:ioasys_pokedex/app/models/description_model.dart';

import '../services/dio_service.dart';
import '../utils/api.dart';

abstract class IDescriptionRepository {
  Future<Description> getDescription(int id);
}

class DescriptionRepository implements IDescriptionRepository {
  final DioService _dioService;

  DescriptionRepository(this._dioService);

  @override
  Future<Description> getDescription(int id) async {
    var result = await _dioService.getDio().get(API.REQUEST_DESCRIPTION(id));

    return Description.fromJson(result.data);
  }
}
