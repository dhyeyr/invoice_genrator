// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:invoice_genrator/util.dart';

import 'constant.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController customernameController = TextEditingController();
TextEditingController invoice_numberController = TextEditingController();
TextEditingController product_nameController = TextEditingController();
TextEditingController product_typeController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController date_due = TextEditingController();
TextEditingController tax_percentageController = TextEditingController();
TextEditingController date_purchase = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {


    return Form(
      key: formKey,
      child: Scaffold(
          appBar: (AppBar(
            title: Text("Invoice Generator"),
            centerTitle: true,
          )),
          body: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: customernameController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Customer Name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Customer Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(5)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: invoice_numberController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Invoice Number";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Invoice Number",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.all(5)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: product_nameController,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "Enter Product Name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(5)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: date_purchase,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Enter Joined Date";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'DD/MM/YYYY',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder())),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          controller: quantityController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Quantity ";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Quantity",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          controller: priceController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Price";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Price",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                       child: TextFormField(
                            controller: date_due,
                            validator: (value) {
                              if (value?.isEmpty ?? false) {
                                return "Enter Joined Date";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'DD/MM/YYYY',
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder()))),

                        SizedBox(width: 10),
                      Flexible(
                        child: TextFormField(
                          controller: tax_percentageController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return "Enter Tax Percentage";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Tax %",
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.all(5)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          FocusScope.of(context)
                              .unfocus(); // For keyboard Close
                          formKey.currentState?.save();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Save Successfully"),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            action: SnackBarAction(
                              label: "Send",
                              onPressed: () {},
                            ),
                          ));
                          invoice.cust_name = customernameController.text;
                          invoice.invoice_no = invoice_numberController.text;
                          invoice.product_name = product_nameController.text;
                          invoice.product_type = product_typeController.text;
                          invoice.date_duee = date_due.text;
                          invoice.date_pur = date_purchase.text;

                          invoice.product_quantity1 = quantityController.text;
                          invoice.product_price1 = priceController.text;
                          invoice.tax_rate1 = priceController.text;

                          // invoice.total=(invoice.product_quantity!*invoice.product_price!);
                          Navigator.pushNamed(context, pdfScreenRoute,
                              arguments: invoice);
                          print("Total ${invoice.total}");
                        } else {
                          print("Invalid");
                        }
                      },
                      child: Text("Save")),
                ],
              ),
            ),
          )),
    );
  }
}
