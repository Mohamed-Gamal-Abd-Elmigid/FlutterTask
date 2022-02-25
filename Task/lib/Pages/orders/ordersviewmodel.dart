// ignore: file_names
import 'dart:convert';
import 'package:task/Extintions/parsedouble.dart';
import 'package:flutter/services.dart';
import 'package:pmvvm/view_model.dart';
import 'package:task/models/FlapKapModel.dart';

class OrdersViewModel extends ViewModel {
  List<FlapKap>? flapKapItems;
  String totalScore = "";
  List<String> prices = [];
  List<String> millions = [];
  List<String> returns = [];
  double finalMil = 0.0;

  // List<dynamic> flapKapList = [];

  @override
  void init() {
    super.init();
    loadJsonData();
  }

  Future<List<FlapKap>> loadJsonData() async {
    var jsonData = await rootBundle.loadString('assets/jsonFile/orders.json');
    final flapKapList = json.decode(jsonData) as List<dynamic>;
    flapKapItems = flapKapList.map((e) => FlapKap.fromJson(e)).toList();
    print("total count " + flapKapItems!.length.toString());
    for (int i = 0; i < flapKapItems!.length; i++) {
      millions.add(flapKapList[i]["price"].substring(1, 2));
      prices.add(flapKapList[i]["price"].substring(3));
      if (flapKapList[i]['status'] == "RETURNED") {
        returns.add(flapKapList[i]['status']);
      }
    }
    print("NUMBER OF RETURNS " + returns.length.toString());
    double aaaa = calculateAverageMillions(millions);
    double bbbb = calculateAveragePrice(prices);
    finalMil = aaaa + bbbb;
    print("Average Prices " + finalMil.toString());
    return flapKapList.map((e) => FlapKap.fromJson(e)).toList();
  }

  double calculateAverageMillions(List<String> million) {
    double sum = 0;
    int mil = 0;
    for (var item in million) {
      mil = item.convToInt();
      sum += mil;
    }
    sum = sum * 1000000;
    print("SUMMMMM " + sum.toString());
    return sum;
  }

  double calculateAveragePrice(List<String> price) {
    double sum = 0.0;
    double thous = 0.0;
    for (var item in price) {
      String newItem = item.replaceAll(",", ".");
      thous = newItem.toDouble();
      sum += thous;
    }
    print("FIANL SUM " + sum.toString());

    return sum;
    // double fin = (sum / prices.length);
    // print("Average Sum " + fin.toString());
  }
}
