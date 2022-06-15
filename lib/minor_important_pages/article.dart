import 'package:flutter/cupertino.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails(
      {Key? key,
        required this.isIOS,
      required this.title,
      required this.price,
      required this.api,
      required this.image})
      : super(key: key);
  final bool isIOS;
  final String title;
  final double price;
  final String api;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          image,
          !isIOS ? Text("Es IOS") : Text("Es Android"),
          !isIOS ? Text("Es IOS") : Text("Es Android"),
          !isIOS ? Text("Es IOS") : Text("Es Android"),
          !isIOS ? Text("Es IOS") : Text("Es Android"),
          !isIOS ? Text("Es IOS") : Text("Es Android"),
        ],
      )),
    );
  }
}
