import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Página Principal'),
          floating: true,
          snap: true,
          backgroundColor: Colors.red,
          expandedHeight: 100,
          flexibleSpace: SafeArea(
            child: FlexibleSpaceBar(
              background: Center(
                child: Container(
                  color: Colors.red,
                  child: Text(
                    'Aquí un deslizable de fotos',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.90,
                color: Colors.red.withOpacity(0.25),
                child: Swiper(
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
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
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
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
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item $index'),
                        CachedNetworkImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
                        Text('Precio del artículo \$$index'),
                      ],
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
