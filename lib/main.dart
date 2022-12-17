import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'Order Done.dart';
import 'buy.dart';
import 'details.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const InvoiceGenerator(),
        'detail': (context) => const ProductDetails(),
        'buy': (context) => const BuyNow(),
        'orderDone': (context) => const OrderDone(),
      },
    ),
  );
}