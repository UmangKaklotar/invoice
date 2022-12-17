import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Global.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Global.creamColor,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded, color: Global.darkBluishColor,),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 280,
                width: width,
                child: Hero(
                  tag: Key(Global.items[index]['name']),
                  child: Image.asset(Global.items[index]['image']),
                ),
              ),
            ),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  padding: const EdgeInsets.only(top: 60),
                  width: width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(Global.items[index]['name'],
                        style: TextStyle(
                          color: Global.darkBluishColor,
                          fontFamily: 'Iphone',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(Global.items[index]['des'],
                        style: const TextStyle(
                          color: Color(0xff9F9F9F),
                          fontFamily: 'Iphone',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It is a long established fact that a reader",
                        style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Iphone',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ).p16(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            Text("\$${Global.items[index]['price']}",
              style: TextStyle(
                color: Colors.red[800],
                fontSize: 25,
                fontFamily: 'Iphone',
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'buy', arguments: index);
              },
              child: const Text("Buy"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Global.darkBluishColor,
                textStyle: const TextStyle(
                  fontFamily: 'Iphone',
                  fontSize: 20,
                ),
              ),
            ).wh(120, 50),
          ],
        ),
      ),
      backgroundColor: Global.creamColor,
    );
  }
}
