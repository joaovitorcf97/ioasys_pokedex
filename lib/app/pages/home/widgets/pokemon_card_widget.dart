import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/api.dart';

class PokemonCardWidget extends StatelessWidget {
  final int index;
  final int imageId;
  final String name;

  const PokemonCardWidget({
    Key? key,
    required this.index,
    required this.imageId,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: index,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text((index + 1).toString(), style: TextStyle(fontSize: 8)),
            SizedBox(
              width: 72,
              height: 72,
              child: SvgPicture.network(
                API.REQUEST_POKEMON_IMG(imageId),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 24,
              decoration: BoxDecoration(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
