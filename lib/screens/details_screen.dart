import 'package:flutter/material.dart';
import 'package:peliculas_proyecto/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //recibir argumentos de otra pantalla
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate.fixed(
            [
              _PosterAndTitle(
                movie: movie,
              ),
              _OverView(
                movie: movie,
              ),
              _ActorsSlider(
                movie: movie,
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar(this.movie);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true, //widget para ajusar al tamaño
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.backDropImg),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 250,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: const TextStyle(fontSize: 30),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                movie.originalTitle,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outlined,
                    size: 20,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    movie.voteAverage.toString(),
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Text(
        movie.overview,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

class _ActorsSlider extends StatelessWidget {
  const _ActorsSlider({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * .3,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Actores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, int index) => _Actors(movie),
          ))
        ],
      ),
    );
  }
}

class _Actors extends StatelessWidget {
  const _Actors(
    this.movie,
  );
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 210,
      color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              width: 130,
              height: 145,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Id ut ullamco non quis aliqua nulla duis.',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
