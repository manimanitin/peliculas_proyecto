import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            )
          ],
          elevation: 0,
          title: const Center(
            child: Text('Peliculas en cine'),
          ),
        ),
        body: const Column(children: [
          CardSwiper(),
          MovieSlider(),
        ]),
      ),
    );
  }
}
