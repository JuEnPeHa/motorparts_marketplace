import 'package:flutter/material.dart';

class SliverMostSelledWidget extends StatelessWidget {
  static const List<String> articleImages = [
    'https://picsum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200',
  ];

  static const List<String> brandNames = [
    'Italika',
    'Vento',
    'Dinamo',
    'BMW',
  ];

  final Widget brandRoute;
  const SliverMostSelledWidget({
    super.key,
    required this.brandRoute,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 85,
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: brandNames.isEmpty
              ? [
                  Center(
                    child: Text('No hay marcas disponibles'),
                  )
                ]
              : brandNames
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => brandRoute,
                          ),
                        );
                      },
                      child: MostSelledWidget(
                        articleImage: articleImages[brandNames.indexOf(e)],
                        brandName: e,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}

class MostSelledWidget extends StatelessWidget {
  final String articleImage;
  final String brandName;
  const MostSelledWidget({
    super.key,
    required this.articleImage,
    required this.brandName,
  });

  @override
  Widget build(BuildContext context) {
    const double heightAndWidth = 75;
    final Size size = MediaQuery.of(context).size;
    final double eachItemWidth = size.width / 5 - 10;
    return NeumorphicContainer(
      child: Container(
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          alignment: Alignment.center,
          height: eachItemWidth,
          width: eachItemWidth,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                child: Image.network(
                  articleImage,
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              FittedBox(
                child: Text(
                  brandName,
                ),
              ),
            ],
          )),
    );
  }
}

class NeumorphicContainer extends StatelessWidget {
  // The Widget to be displayed inside the container in a Neumorphic way
  final Widget child;
  // The color of the seed of the Neumorphic effect; Should be grey or white?
  final Color seedColor;
  const NeumorphicContainer({
    super.key,
    required this.child,
    this.seedColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: seedColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: seedColor.withOpacity(0.15),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: const Offset(2, 2), // changes position of shadow
          ),
          BoxShadow(
            color: seedColor.withOpacity(0.15),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: const Offset(-2, -2), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
