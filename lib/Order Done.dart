import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:velocity_x/velocity_x.dart';

import 'Global.dart';

class OrderDone extends StatefulWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {
  
  Future<Uint8List> createPDF(PdfPageFormat format) async {
    final pdf = pw.Document();
    final time = DateTime.now();
    var image = pw.MemoryImage(
        (await rootBundle.load('build/invoice/QR.png'))
            .buffer
            .asUint8List(),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: format,
          build: (context) {
            return pw.Center(
              child: pw.Container(
                padding: const pw.EdgeInsets.all(20),
                height: 3508,
                width: 2480,
                color: PdfColors.white,
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Expanded(
                          flex: 2,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(Global.userName,
                                style: pw.TextStyle(
                                  fontSize: 13,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.SizedBox(height: 3),
                              pw.Text("+91 ${Global.userPhone}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(height: 2),
                              pw.Text("${Global.userAdd}, ${Global.userCity}, ${Global.userState}, ${Global.userCountry} - ${Global.userPinCode}",
                                style: const pw.TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Align(
                            alignment: pw.Alignment.centerRight,
                            child: pw.Image(image, height: 70),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 20),
                    pw.SizedBox(
                      height: 64,
                      child: pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Expanded(
                            flex: 4,
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                                pw.Text("Apple Inc.",
                                  style: pw.TextStyle(
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.SizedBox(height: 2),
                                pw.Text("Shop No 5, Silver Business Hub, Surat",
                                  style: const pw.TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Column(
                              children: [
                                pw.Row(
                                  children: [
                                    pw.Text("Invoice Number :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("${time.year} - 1506",
                                      style: const pw.TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text("Invoice Date :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("${time.day}/${time.month}/${time.year}",
                                      style: const pw.TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text("Payment Terms :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("1 days",
                                      style: const pw.TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text("Due Date :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("${time.day}/${time.month}/${time.year}",
                                      style: const pw.TextStyle(
                                        fontSize: 12,
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
                    pw.SizedBox(height: 40),
                    pw.Text("INVOICE",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text("My description...",
                      style: const pw.TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                      height: 30,
                      color: const PdfColor.fromInt(0xffE0E0E0),
                      alignment: pw.Alignment.centerRight,
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 5,
                            child: pw.Align(
                              alignment: pw.Alignment.centerLeft,
                              child: pw.Text("Product Name",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("Date",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("Quantity",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("Price",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("Discount",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("Total",
                                style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(horizontal: 5),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 5,
                            child: pw.Align(
                              alignment: pw.Alignment.centerLeft,
                              child: pw.Text(Global.items[Global.index]['name'],
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("${time.day}/${time.month}/${time.year}",
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("${Global.items[Global.index]['quantity']}",
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("\$${Global.items[Global.index]['price']}",
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("0 %",
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Align(
                              alignment: pw.Alignment.centerRight,
                              child: pw.Text("\$${int.parse(Global.items[Global.index]['price']) * Global.items[Global.index]['quantity']}",
                                style: const pw.TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 100),
                    pw.Container(
                      height: 1,
                      color: PdfColors.black,
                    ),
                    pw.SizedBox(height: 10),
                    pw.SizedBox(
                      child: pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Expanded(
                            flex: 6,
                            child: pw.Container(),
                          ),
                          pw.Expanded(
                            flex: 3,
                            child: pw.Column(
                              children: [
                                pw.Row(
                                  children: [
                                    pw.Text("Price :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("\$${int.parse(Global.items[Global.index]['price']) * Global.items[Global.index]['quantity']}",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 2),
                                pw.Row(
                                  children: [
                                    pw.Text("Discount :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("0 %",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 5),
                                pw.Container(
                                  height: 1,
                                  color: PdfColors.black,
                                ),
                                pw.SizedBox(height: 5),
                                pw.Row(
                                  children: [
                                    pw.Text("Total Amount :",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                    pw.Spacer(),
                                    pw.Text("\$${int.parse(Global.items[Global.index]['price']) * Global.items[Global.index]['quantity']}",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 5),
                                pw.Container(
                                  height: 1,
                                  color: PdfColors.black,
                                ),
                                pw.SizedBox(height: 2),
                                pw.Container(
                                  height: 1,
                                  color: PdfColors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Container(
                      height: 1,
                      color: PdfColors.black,
                    ),
                    pw.SizedBox(height: 10),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("Address  ",
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text("Shop No 5, Silver Business Hub, Surat",
                          style: const pw.TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 2),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text("Website  ",
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text("www.catalog.com",
                          style: const pw.TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
    
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('build/invoice/done.gif', height: 200),
            const Spacer(),
            const Text("Your Order\nHas Been Accepted",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff111416),
                fontFamily: 'Iphone',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 15),
            Text("Your Order Will be Delivered soon.\nThank You For Choosing our App!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontFamily: 'Iphone',
                fontSize: 20,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await Printing.layoutPdf(
                  onLayout: (format) => createPDF(PdfPageFormat.a4),
                );
              },
              child: const Text("Download PDF"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Global.darkBluishColor,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Iphone',
                ),
              ),
            ).wh(200, 50),
            const SizedBox(height: 5,),
            InkWell(
              splashFactory: InkRipple.splashFactory,
              borderRadius: BorderRadius.circular(20),
              onTap: (){
                Global.items[Global.index]['quantity'] = 1;
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: Container(
                height: 40,
                width: 150,
                alignment: Alignment.center,
                child: const Text("Back To Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Iphone',
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}



class PDF extends StatefulWidget {
  const PDF({Key? key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 3508,
          width: 2480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Umang Kaklotar",
                          style: TextStyle(
                              fontFamily: 'Iphone',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5
                          ),
                        ),
                        Text("50, Parvati Nagar - 2, Bapa Sitaram Chowk, katargam, Surat",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset('build/invoice/QR.png', height: 70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 56,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("Apple Inc.",
                            style: TextStyle(
                                fontFamily: 'Iphone',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5
                            ),
                          ),
                          Text("Apple Street, Cupertino, CA 95014",
                            style: TextStyle(
                              fontFamily: 'Iphone',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text("Invoice Number :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("2021-9999",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text("Invoice Date :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("3/25/2021",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text("Payment Terms :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("7 days",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text("Due Date :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("4/1/2021",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontSize: 12,
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
              const SizedBox(height: 40),
              const Text("INVOICE",
                style: TextStyle(
                  fontFamily: 'Iphone',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text("My description...",
                style: TextStyle(
                  fontFamily: 'Iphone',
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 30,
                color: const Color(0xffE0E0E0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: const [
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Product Name",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Date",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Quantity",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Price",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Discount",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Total",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("iPhone Watch",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("10/12/2022",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("2",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("/${999}",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("0 %",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("/${999}",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text("Price :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("/${999}",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text("Discount :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("/${999}",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: const [
                              Text("Total Amount :",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Text("/${999}",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 2),
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Address  ",
                    style: TextStyle(
                        fontFamily: 'Iphone',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Shop No 5, Silver Business Hub, Surat",
                    style: TextStyle(
                      fontFamily: 'Iphone',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Website  ",
                    style: TextStyle(
                      fontFamily: 'Iphone',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("www.catalog.com",
                    style: TextStyle(
                      fontFamily: 'Iphone',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

