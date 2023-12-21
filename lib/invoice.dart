// ignore_for_file: non_constant_identifier_names
class Invoice{
  String? cust_name;
  String? invoice_no;
  String? product_name;
  String? date_pur;
  String? product_type;
  String? date_duee;

  String? product_quantity1;
  String? product_price1;
  String? tax_rate1;
  String? total1;

  int? product_quantity;
  int? product_price;
  int? tax_rate;
  int? total;


  void display(){
    print("name $cust_name");
  }
}