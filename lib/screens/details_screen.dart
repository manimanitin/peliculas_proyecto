import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //recibir argumentos de otra pantalla
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'Sin nombre';
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate.fixed(
            [
              _PosterAndTitle(),
              _OverView(),
              _ActorsSlider(),
            ],
          )),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();
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
          child: const Text(
            'movie.title}',
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/no-image.jpg'),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 250,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title}',
                style: TextStyle(fontSize: 30),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.titleOriginal',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outlined,
                    size: 20,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: TextStyle(fontSize: 12),
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
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: const Text(
        'Consectetur anim laborum aute duis cillum adipisicing sit proident adipisicing. Occaecat occaecat occaecat minim fugiat id cupidatat. Lorem et dolor consectetur deserunt exercitation.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class _ActorsSlider extends StatelessWidget {
  const _ActorsSlider({super.key});

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
            itemBuilder: (_, int index) => const _Actors(),
          ))
        ],
      ),
    );
  }
}

class _Actors extends StatelessWidget {
  const _Actors();

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
