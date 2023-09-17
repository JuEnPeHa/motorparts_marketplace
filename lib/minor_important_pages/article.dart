import 'package:flutter/material.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails(
      {Key? key,
      required this.isIOS,
      required this.title,
      required this.price,
      required this.api,
      required this.image,
      required this.description})
      : super(key: key);
  final bool isIOS;
  final String title;
  final double price;
  final String api;
  final Widget image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Appbar
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: image,
            ),
          ),
          //Body
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Wrap(
                  children: [
                    //Title
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    //Price
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                //Buy Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Buy'),
                  ),
                ),
                //Description
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
