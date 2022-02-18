import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pokemonArgs = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Row(
                  children: [Text('Grass'), Text('Poison')],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add),
                            Text('6,9 KG'),
                          ],
                        ),
                        Text('Weight')
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add),
                            Text('6,9 KG'),
                          ],
                        ),
                        Text('Weight')
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add),
                            Text('6,9 KG'),
                          ],
                        ),
                        Text('Weight')
                      ],
                    ),
                  ],
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
              ],
            ),
          ),
        ));
  }
}
