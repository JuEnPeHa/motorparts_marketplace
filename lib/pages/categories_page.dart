import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CategoryPlaceholder extends StatelessWidget {
  final List<String> articleImages = [
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    'https://images.unsplash.com/photo-1612835362596-4b7b7b0b2b0b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW90b3JwYXJ0cyUyMGFydCUyMGFydGljbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
  ];

  final Widget moreArticlesOfThisCategoryRoute;
  CategoryPlaceholder({
    super.key,
    required this.moreArticlesOfThisCategoryRoute,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
