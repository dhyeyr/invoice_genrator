// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter, non_constant_identifier_names

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:invoice_genrator/invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFscreen extends StatefulWidget {
  const PDFscreen({super.key});

  @override
  State<PDFscreen> createState() => _PDFscreenState();
}

class _PDFscreenState extends State<PDFscreen> {
  Invoice? myResume;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    myResume = ModalRoute.of(context)?.settings.arguments as Invoice?;
    myResume?.display();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF SCREEN"),
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) {
          return genPdf();
        },
      ),
    );
  }

  Future<Uint8List> genPdf() {
    pw.Document doc = pw.Document();

    doc.addPage(pw.Page(
      build: (context) {
        return pw.Container(
          decoration: pw.BoxDecoration(),
          child: pw.Column(
            children: [
              pw.Container(
                margin: pw.EdgeInsets.only(left: 8, right: 8),
                width: double.infinity,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.white),
                  color: PdfColors.white,
                ),
                // padding: pw.EdgeInsets.all(8),
                height: 90,
                child: pw.Column(
                  children: [
                    pw.Center(
                        child: pw.Text("Red&White Multimedia Educatoin.LTD",
                            style: pw.TextStyle(fontSize: 20))),
                    pw.SizedBox(height: 5),
                    pw.Center(
                        child: pw.Text(
                            "office: Bapasitaram Chowk,Mavdibypass road,Rajkot",
                            style: pw.TextStyle(fontSize: 15))),
                    pw.SizedBox(height: 2),
                    // pw.Center(
                    //     child: pw.Text("Tel:- 0281 2380707,9025719",
                    //         style: pw.TextStyle(fontSize: 15))),
                    // pw.SizedBox(height: 2),
                    // pw.Center(
                    //     child: pw.Text("Mo:- 6351087705,",
                    //         style: pw.TextStyle(fontSize: 15))),
                  ],
                ),
              ),
              pw.Row(children: [
                pw.Column(children: [
                  pw.Container(
                    // margin: pw.EdgeInsets.only(top: 8, left: 8, right: 8),
                    padding: pw.EdgeInsets.only(right: 0),
                    // color: PdfColors.grey,
                    height: 30,
                    child: pw.Center(
                        child: pw.Text(
                            "Client name:\n"
                            " ${myResume?.cust_name ?? ""}",
                            style: pw.TextStyle(fontSize: 15))),
                  ),
                  pw.Container(
                    // margin: pw.EdgeInsets.only(top: 8, left: 8, right: 8),
                    padding: pw.EdgeInsets.only(left: 25),
                    // color: PdfColors.grey,
                    // width: double.infinity,
                    height: 30,
                    child: pw.Center(
                        child: pw.Text(
                            "\npurchased date:\n"
                                "  ${myResume?.date_pur ?? ""}",
                            style: pw.TextStyle(fontSize: 15))),
                  ),

                ]),
                pw.Column(
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 200 ),
                      child: pw.Center(
                          child: pw.Text(
                              "Invoice",
                            style: pw.TextStyle(fontSize: 40,color: PdfColors.redAccent),

                          )),
                    ),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 110 ),
                      child: pw.Center(
                          child: pw.Text(
                            "${myResume?.invoice_no ?? ""}",
                            style: pw.TextStyle(fontSize: 15),
                          )),
                    ),
                  ]
                )
              ]),

              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "DESCRIPTION",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
        margin: pw.EdgeInsets.only(left: 10,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "RATE",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
        margin: pw.EdgeInsets.only(left: 0,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "QTY",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 0,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "TAX ",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 0,top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "TOTAL",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                ],
              ),

              pw.Divider(),
              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.product_name ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 10,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.product_price1 ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),

                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 0,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.product_quantity1 ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 0,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.tax_rate1 ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 0,top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.product_price1 ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                ],
              ),

              pw.SizedBox(height: 200),
              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "Payment Methods :",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),

                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 40,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "Due Date :",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(left: 35,top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "Total Due",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                ],
              ),

              pw.Row(
                children: [
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 20),
                    width: 100,
                    height: 30,

                    child: pw.Center(
                        child: pw.Text(
                          "DESCRIPTION",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 40,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.date_duee ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),
                  pw.Container(
                    width: 100,
                    height: 30,
                    margin: pw.EdgeInsets.only(left: 40,top: 20),
                    child: pw.Center(
                        child: pw.Text(
                          "${myResume?.product_price1 ?? ""}",
                          style: pw.TextStyle(fontSize: 13),
                        )),
                  ),

                ],
              ),


              pw.SizedBox(height: 60),
              pw.Text(
                  "his is Autogenerated Invoice it's Doesn't Need Signature"),
            ],
          ),
        );
      },
    ));

    return doc.save();
  }
}

/*
String? cust_name;
String? invoice_no;
String? product_name;
String? product_type;
String? tax_type;

String? product_quantity1;
String? product_price1;
String? tax_rate1;
String? total1;

 */
