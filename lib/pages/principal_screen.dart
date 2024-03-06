// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/minor_important_pages/article.dart';
import 'package:motorparts_marketplace/pages/cart_screen.dart';
import 'package:motorparts_marketplace/widgets/most_selled_brand_widget.dart';

const String loremIpsum = 'Lorem Ipsum is simply dummy text of the printing '
    'and typesetting industry. Lorem Ipsum has been the industry\'s standard '
    'dummy text ever since the 1500s, when an unknown printer took a galley '
    'of type and scrambled it to make a type specimen book. It has survived '
    'not only five centuries, but also the leap into electronic typesetting, '
    'remaining essentially unchanged. It was popularised in the 1960s with '
    'the release of Letraset sheets containing Lorem Ipsum passages, and more '
    'recently with desktop publishing software like Aldus PageMaker including '
    'versions of Lorem Ipsum.';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isIOs() {
      return Platform.isIOS;
    }

    String _api(int index) {
      return 'https://picsum.photos/id/${index + 25}/200/300';
    }

    Widget _buildImage(int index) {
      return CachedNetworkImage(
        imageUrl: _api(index),
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      );
    }

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          title: Text('Motorparts Marketplace'),
          floating: true,
          snap: true,
          scrolledUnderElevation: 0,
          stretch: true,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.80),
          expandedHeight: MediaQuery.of(context).size.height * 0.05,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ArticleSearch(),
                );
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartScreen();
                }));
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.80),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            //color: Colors.deepPurple.withOpacity(0.75),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.90,
                  //color: Colors.purple.withOpacity(0.25),
                  child: Swiper(
                      autoplay: false,
                      autoplayDisableOnInteraction: true,
                      duration: 2000,
                      autoplayDelay: 10000,
                      pagination: SwiperPagination(),
                      control: SwiperControl(
                        color: Colors.white,
                        size: 20,
                      ),
                      controller: SwiperController(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://comotos.co/wp-content/uploads/2015/01/Motor-1.jpg',
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
              ),
            ),
          ),
        ),
        SliverMostSelledWidget(
          brandRoute: Container(),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            //mainAxisSpacing: 10,
            //crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final String title = 'Articulo $index';
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  child: InkWell(
                    onTap: () {
                      print('Tocaste la foto $index');
                      Navigator.push(
                        context,
                        _isIOs()
                            ? CupertinoPageRoute(
                                builder: (context) => ArticleDetails(
                                  isIOS: _isIOs(),
                                  title: title,
                                  api: '',
                                  image: _buildImage(index),
                                  price: index.toDouble(),
                                  description: loremIpsum,
                                ),
                              )
                            : MaterialPageRoute(
                                builder: (context) => ArticleDetails(
                                  isIOS: _isIOs(),
                                  title: title,
                                  api: '',
                                  image: _buildImage(index),
                                  price: index.toDouble(),
                                  description: loremIpsum,
                                ),
                              ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white70,
                      // Theme.of(context)
                      //     .cardColor
                      //     .withOpacity(0.125)
                      //     .withGreen(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.30,
                            width: MediaQuery.of(context).size.width * 0.45,
                            //width: MediaQuery.of(context).size.width / 2,
                            child: _buildImage(index),
                          ),
                          Text(
                            title,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Precio del artículo \$$index',
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: 25,
          ),
        ),
      ],
    );
  }
}

class ArticleSearch extends SearchDelegate<String> {
  final List<String> _articles = [
    'Articulo 1',
    'Articulo 2',
    'Articulo 3',
    'Articulo 4',
    'Articulo 5',
    'Articulo 6',
    'Articulo 7',
    'Articulo 8',
    'Articulo 9',
    'Articulo 10',
    'Articulo 11',
    'Articulo 12',
    'Articulo 13',
    'Articulo 14',
    'Articulo 15',
    'Articulo 16',
    'Articulo 17',
    'Articulo 18',
    'Articulo 19',
    'Articulo 20',
    'Articulo 21',
    'Articulo 22',
    'Articulo 23',
    'Articulo 24',
    'Articulo 25',
    'Articulo 26',
    'Articulo 27',
    'Articulo 28',
    'Articulo 29',
    'Articulo 30',
    'Articulo 31',
    'Articulo 32',
    'Articulo 33',
    'Articulo 34',
    'Articulo 35',
    'Articulo 36',
    'Articulo 37',
    'Articulo 38',
    'Articulo 39',
    'Articulo 40',
    'Articulo 41',
    'Articulo 42',
    'Articulo 43',
    'Articulo 44',
    'Articulo 45',
    'Articulo 46',
    'Articulo 47',
    'Articulo 48',
    'Articulo 49',
    'Articulo 50',
    'Articulo 51',
    'Articulo 52',
    'Articulo 53',
    'Articulo 54',
    'Articulo 55',
    'Articulo 56',
    'Articulo 57',
    'Articulo 58',
    'Articulo 59',
    'Articulo 60',
    'Articulo 61',
    'Articulo 62',
    'Articulo 63',
    'Articulo 64',
    'Articulo 65',
    'Articulo 66',
    'Articulo 67',
    'Articulo 68',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones del AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          print('Buscando...');
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        print('Leading icon pressed');
        close(context, "null");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blueAccent,
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escribe
    final List<String> suggestionList = query.isEmpty
        ? _articles
        : _articles
            .where((element) => element.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.shopping_cart),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            print('Tocaste la sugerencia $index');
            showResults(context);
          },
        );
      },
    );
  }
}
