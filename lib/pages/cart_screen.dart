import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/providers/cart_provider.dart';
import 'package:motorparts_marketplace/widgets/card_container.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.red.withOpacity(0.75),
        elevation: 0,
        title: Text(
          'Carrito',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ColoredBox(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        child: SafeArea(
          child: Column(children: [
            Expanded(
              child: ColoredBox(
                color: Colors.black,
              ),
            ),
            Center(
              child: Text(
                'Carrito',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  // CardOrderSummaryPaymentAndAddress(
                  //   address: address.address,
                  //   addressName: address.addressName,
                  //   addressPhone: address.addressPhone,
                  //   paymentMethod: paymentMethod.paymentMethod,
                  //   paymentMethodNumber: paymentMethod.paymentMethodNumber,
                  //   paymentMethodExpireDate:
                  //       paymentMethod.paymentMethodExpireDate,
                  //   total: 1000.toString(),
                  //   shipping: 100.toString(),
                  //   discount: 100.toString(),
                  //   subtotal: 100.toString(),
                  // ),
                  for (int i = 0; i < cartProvider.items.length; i++)
                    CartProduct(
                      productName: cartProvider.items[i].name,
                      productPrice: cartProvider.items[i].price.toString(),
                      productQuantity:
                          cartProvider.items[i].quantity.toString(),
                      productImageBase64:
                          cartProvider.items[i].productImageBase64,
                    ),
                ],
              ),
            ),
            CardContainer(
                child: Container(
              color: Colors.red,
              height: 50,
              width: double.infinity,
              child: CupertinoButton(
                child: const Text('Pagar ahora'),
                onPressed: () {},
              ),
            )),
          ]),
        ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.productImageBase64,
  });

  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productImageBase64;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.memory(
              base64Decode(productImageBase64),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(productPrice),
                Text(productQuantity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
