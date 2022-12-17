import 'dart:io';

import 'package:flutter/cupertino.dart';

class Global{
  static Color creamColor = const Color(0xffF4F6F3);
  static Color darkBluishColor = const Color(0xff373450);
  static int index = 0;
  static File? image;
  static GlobalKey<FormState> buyNowKey = GlobalKey<FormState>();
  static String userName = "", userAdd = "", userPhone = "", userPinCode = "", userCity = "", userState = "", userCountry = "";
  static List<Map<String,dynamic>> items = [
    {
      'name': 'iPhone 12 Pro',
      'des': 'Apple iPhone 12th generation',
      'image': 'build/invoice/1.png',
      'price': '999',
      'quantity': 1,
    },
    {
      'name': 'Google Pixel 5',
      'des': 'Google Pixel phone 5th generation',
      'image': 'build/invoice/2.png',
      'price': '699',
      'quantity': 1,
    },
    {
      'name': 'M1 Macbook Air',
      'des': 'Apple Macbook Air with apple silicon',
      'image': 'build/invoice/3.png',
      'price': '1099',
      'quantity': 1,
    },
    {
      'name': 'Playstation 5',
      'des': 'Sony Playstation 5th generation',
      'image': 'build/invoice/4.png',
      'price': '500',
      'quantity': 1,
    },
    {
      'name': 'Airpods Pro',
      'des': 'Apple Airpods Pro 1st generation',
      'image': 'build/invoice/5.png',
      'price': '200',
      'quantity': 1,
    },
    {
      'name': 'iPad Pro',
      'des': 'Apple iPad Pro 2020 edition',
      'image': 'build/invoice/6.png',
      'price': '799',
      'quantity': 1,
    },
    {
      'name': 'Galaxy S21 Ultra',
      'des': 'Samsung Galaxy S21 Ultra 2021 edition',
      'image': 'build/invoice/7.png',
      'price': '1299',
      'quantity': 1,
    },
    {
      'name': 'I Watch 8 Ultra',
      'des': 'Apple Watch 8 Ultra 2022 Edition',
      'image': 'build/invoice/8.png',
      'price': '999',
      'quantity': 1,
    },
  ];
}