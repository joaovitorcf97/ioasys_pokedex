import 'package:flutter/material.dart';
import 'package:ioasys_pokedex/app/models/description_model.dart';
import 'package:ioasys_pokedex/app/repositories/description_repository.dart';

class DescriptionController {
  final DescriptionRepository _descritpionRepository;
  final int id;

  DescriptionController(this._descritpionRepository, this.id) {
    fetch();
  }

  ValueNotifier<Description?> description = ValueNotifier<Description?>(null);

  fetch() async {
    description.value = await _descritpionRepository.getDescription(id);
  }
}
