import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/minor_important_pages/article.dart';

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
      slivers: [
        SliverAppBar(
          title: const Text('Página Principal'),
          floating: true,
          snap: true,
          scrolledUnderElevation: 0,
          stretch: true,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.80),
          expandedHeight: MediaQuery.of(context).size.height * 0.05,
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
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            //mainAxisSpacing: 10,
            //crossAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      print('Tocaste la foto $index');
                      Navigator.push(
                        context,
                        _isIOs()
                            ? CupertinoPageRoute(
                                builder: (context) => ArticleDetails(
                                  isIOS: _isIOs(),
                                  title: '',
                                  api: '',
                                  image: _buildImage(index),
                                  price: 0,
                                ),
                              )
                            : MaterialPageRoute(
                                builder: (context) => ArticleDetails(
                                  isIOS: _isIOs(),
                                  title: '',
                                  api: '',
                                  image: _buildImage(index),
                                  price: 0,
                                ),
                              ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).cardColor.withOpacity(0.25),
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
                            'Item $index',
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