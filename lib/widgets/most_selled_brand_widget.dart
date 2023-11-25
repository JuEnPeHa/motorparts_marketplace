import 'package:flutter/material.dart';

class SliverMostSelledWidget extends StatelessWidget {
  static const List<String> articleImages = [
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
  ];

  static const List<String> brandNames = [
    'Brand 1',
    'Brand 2',
    'Brand 3',
    'Brand 4',
    'Brand 5',
  ];

  final Widget brandRoute;
  const SliverMostSelledWidget({
    super.key,
    required this.brandRoute,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      initialItemCount: brandNames.length,
      itemBuilder: (context, index, animation) {
        return brandNames.isEmpty
            ? const SliverToBoxAdapter(
                child: Center(
                  child: Text('No hay marcas disponibles'),
                ),
              )
            : FadeTransition(
                opacity: animation,
                child: MostSelledWidget(),
              );
        // return FadeTransition(
        //   opacity: animation,
        //   child: MostSelledWidget(),
        // );
      },
    );
  }
}

class MostSelledWidget extends StatelessWidget {
  const MostSelledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MostSelledPlaceholder extends StatelessWidget {
  final List<String> articleImages = [
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
  ];

  final Widget brandRoute;
  MostSelledPlaceholder({
    super.key,
    required this.brandRoute,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
