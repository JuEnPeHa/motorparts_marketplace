import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/pages/payment/payment_page.dart';
import 'package:motorparts_marketplace/providers/cart_provider.dart';
import 'package:motorparts_marketplace/widgets/card_container.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0,
        title: Text(
          'Carrito',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.colorScheme.onPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Icon(
              Icons.shopping_cart,
              color: theme.colorScheme.onPrimary,
            ),
          )
        ],
      ),
      body: ColoredBox(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        child: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 5,
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
                      productImageUrl: cartProvider.items[i].image,
                      addProduct: () {
                        cartProvider.incrementQuantity(
                          cartProvider.items[i],
                        );
                      },
                      removeProduct: () {
                        cartProvider.removeSingleQuantity(
                          cartProvider.items[i],
                        );
                      },
                      deleteProduct: () {
                        cartProvider.removeItem(
                          cartProvider.items[i],
                        );
                      },
                    ),
                ],
              ),
            ),
            CardContainer(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    height: 25,
                    width: double.infinity,
                    child: FittedBox(
                      child: Text(
                        'Total: \$${cartProvider.totalPrice}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ))),
            CardContainer(
                child: Container(
              color: theme.colorScheme.primary,
              height: 50,
              width: double.infinity,
              child: CupertinoButton(
                child: Text(
                  'Pagar ahora',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage()));
                },
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
    required this.productImageUrl,
    // required this.productImageBase64,
    required this.addProduct,
    required this.removeProduct,
    required this.deleteProduct,
  });

  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productImageUrl;
  // final String productImageBase64;
  final Function() addProduct;
  final Function() removeProduct;
  final Function() deleteProduct;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return CardContainer(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              productImageUrl,
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
                Text(
                  'Precio: \$$productPrice',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 50),
                    child: Container(
                      color:
                          theme.colorScheme.tertiaryContainer.withOpacity(0.25),
                      child: Text(
                        // max 3 digits
                        productQuantity.length > 3
                            ? productQuantity.substring(0, 3)
                            : productQuantity,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                // Text(productQuantity),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: theme.colorScheme.onPrimary,
                    ),
                    onPressed: addProduct,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: theme.colorScheme.onPrimary,
                    ),
                    onPressed: removeProduct,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
