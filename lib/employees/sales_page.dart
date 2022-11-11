import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_myapp/employees/models/sales_model.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter_new/flutter.dart' as charts;

class SalesPage extends StatefulWidget {
  final String title;

  const SalesPage({super.key, required this.title});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<SalesModel> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<SalesModel>.from(data.map((i) => SalesModel.fromJson(i)));
    // .toList();
  }

  String url = "http://localhost/flutter-api/sales/getAllSales.php";

  List<SalesModel> sales = [];

  Future<List<SalesModel>> getData() async {
    List<SalesModel> list = [];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      list = fromJson(response.body);
    }
    return list;
  }

  static List<charts.Series<SalesModel, String>> chartData(
      List<SalesModel> data) {
    return [
      charts.Series<SalesModel, String>(
        id: 'Sales',
        domainFn: (SalesModel sm, _) => sm.date!,
        measureFn: (SalesModel sm, _) => int.parse(sm.revenue!),
        data: data,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    getData().then((value) => sales = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // width: double.infinity,
          height: 400,
          child: charts.BarChart(
            chartData(sales),
            animate: true,
          ),
        ),
      ),
    );
  }
}
