import 'package:flutter/material.dart';
import 'package:invoice/Global.dart';

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({Key? key}) : super(key: key);

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Catalog App",
                style: TextStyle(
                  fontSize: 40,
                  color: Global.darkBluishColor,
                  fontFamily: 'Iphone',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              const Text("Trending Products",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Iphone',
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: Global.items.map((e){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            Navigator.pushNamed(context, 'detail', arguments: Global.items.indexOf(e));
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 140,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                height: height,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Global.creamColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Hero(
                                  tag: Key(e['name']),
                                  child: Image.asset(e['image']),),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e['name'],
                                      style: TextStyle(
                                        color: Global.darkBluishColor,
                                        fontFamily: 'Iphone',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(e['des'],
                                      style: const TextStyle(
                                        color: Color(0xff9F9F9F),
                                        fontFamily: 'Iphone',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.spaceBetween,
                                      buttonPadding: EdgeInsets.zero,
                                      children: [
                                        Text("\$${e['price']}",
                                          style: TextStyle(
                                            color: Global.darkBluishColor,
                                            fontSize: 18,
                                            fontFamily: 'Iphone',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: (){
                                            Navigator.pushNamed(context, 'buy', arguments: Global.items.indexOf(e));
                                          },
                                          child: const Text("Buy"),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            primary: Global.darkBluishColor,
                                            textStyle: const TextStyle(
                                              fontFamily: 'Iphone',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Global.creamColor,
    );
  }
}


