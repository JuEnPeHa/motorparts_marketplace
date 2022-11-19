import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> myProducts = List.generate(
      25,
      (i) => {
        'name': 'Product $i',
        'price': i * 10,
        'id': i,
      },
    ).toList();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Principal ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Screen',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.90,
              color: Colors.red,
              child: const Text(
                'Aquí un deslizable de fotos',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            GridView.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(10),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  for (var i = 0; i < myProducts.length; i++)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: Colors.green.withOpacity(0.25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(myProducts[i]['name']),
                            CachedNetworkImage(
                                imageUrl:
                                    'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80'),
                          ],
                        ),
                      ),
                    ),
                ]),
          ],
        ),
      ),
    );
  }
}