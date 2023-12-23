import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:motorparts_marketplace/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class OldCartScreen extends StatelessWidget {
  const OldCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoSizeGroup myAutoSizeGroup = AutoSizeGroup();
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Stack(children: [
        Positioned(
            child: Column(children: [
              Container(
                color: Colors.red.withOpacity(0.75),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Carrito',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                    ),
                  ],
                ),
              ),
            ]),
            top: 0,
            left: 0,
            right: 0),
        Positioned(
            height: MediaQuery.of(context).size.height - 175,
            width: MediaQuery.of(context).size.width * 1,
            top: 100,
            child: ColoredBox(
              color: Colors.blue.withOpacity(0.75),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.red.withOpacity(0.75),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: CachedNetworkImage(
                                                              imageUrl:
                                                                  cartProvider
                                                                      .items[
                                                                          index]
                                                                      .image),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: AutoSizeText(
                                                            group:
                                                                myAutoSizeGroup,
                                                            'Precio: \$${cartProvider.items[index].price}',
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: AutoSizeText(
                                                      maxLines: 2,
                                                      group: myAutoSizeGroup,
                                                      minFontSize: 16,
                                                      maxFontSize: 20,
                                                      'Producto: ${cartProvider.items[index].name}',
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          RightSideButtonsAddRemove(
                                              cartProvider: cartProvider,
                                              index: index),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 8,
                                      thickness: 1,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                          childCount: cartProvider.items.length)),
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            left: 5,
            right: 5,
            child: ColoredBox(
              color: Colors.green.withOpacity(0.75),
              child: BottomTotalPrice(
                cartProvider: cartProvider,
              ),
            ))
      ]),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({Key? key, required this.cartProvider}) : super(key: key);
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: cartProvider.items.length, //cartProvider.cart.length,
        itemBuilder: (BuildContext context, int index) {
          return cartProvider.items.isNotEmpty
              ? ListTile(
                  title: Text(cartProvider.items[index]
                      .name), //Text(cartProvider.cart[index].name),
                  subtitle: Text(cartProvider.items[index].quantity
                      .toString()), //Text(cartProvider.cart[index].price.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => {/*cartProvider.removeFromCart(index)*/},
                  ),
                )
              : Container(
                  child: Text("Carrito Vacío"),
                );
        },
      ),
    );
  }
}

class BottomTotalPrice extends StatelessWidget {
  const BottomTotalPrice({Key? key, required this.cartProvider})
      : super(key: key);
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width * 0.8,
        color: Color.fromARGB(255, 43, 255, 0).withOpacity(0.15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: Text('Comprar'),
              onPressed: () => Navigator.pushNamed(context, '/cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class RightSideButtonsAddRemove extends StatelessWidget {
  const RightSideButtonsAddRemove(
      {Key? key, required this.cartProvider, required this.index})
      : super(key: key);
  final CartProvider cartProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.white.withOpacity(0.75),
                  child: Text("${cartProvider.items[index].quantity}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: ButtonBar(
              buttonMinWidth: 8,
              buttonPadding: EdgeInsets.all(0),
              buttonHeight: 8,
              mainAxisSize: MainAxisSize.min,
              overflowButtonSpacing: 0.0,
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => cartProvider
                      .removeSingleQuantity(cartProvider.items[index]),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () =>
                      cartProvider.removeItem(cartProvider.items[index]),
                ),
                IconButton(
                  onPressed: (() => cartProvider
                      .incrementQuantity(cartProvider.items[index])),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
