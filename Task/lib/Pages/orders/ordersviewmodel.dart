// ignore: file_names
import 'dart:convert';
import 'package:task/Extintions/parsedouble.dart';
import 'package:flutter/services.dart';
import 'package:pmvvm/view_model.dart';
import 'package:task/models/FlapKapModel.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrdersViewModel extends ViewModel {
  List<FlapKap>? flapKapItems;
  String totalScore = "";
  List<String> prices = [];
  List<String> millions = [];
  List<String> returns = [];
  List<String> times = [];
  double finalMil = 0.0;
  int jan = 0;
  int feb = 0;
  int mar = 0;
  int apr = 0;
  int may = 0;
  int jun = 0;
  int jul = 0;
  int aug = 0;
  int sep = 0;
  int oct = 0;
  int nov = 0;
  int dec = 0;

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
      times.add(flapKapList[i]["registered"].substring(0, 18));
      if (flapKapList[i]['status'] == "RETURNED") {
        returns.add(flapKapList[i]['status']);
      }
    }
    getDate(times);
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

  getMilleseconds(String time) {
    final timeStr = time;
    final format = DateFormat("yyyy-MM-ddTHH:mm:ss");
    final dt = format.parse(timeStr).millisecondsSinceEpoch;
    print("milleSeconds " + dt.toString());
  }

  getDate(List<String> times) {
    // int minTime = 1;
    // int maxTime = 2;
    // String maxTimeIndex = "";
    // String minTimeIndex = "";
    for (int i = 0; i < times.length; i++) {
      final timeStr = times[i];
      final format = DateFormat("yyyy-MM-ddTHH:mm:ss");
      final dt = format.parse(timeStr).millisecondsSinceEpoch;
      if (dt > 1609452001000 && dt < 1612087199000) {
        // print("JAN");
        jan++;
      } else if (dt > 1612130401000 && dt < 1614506399000) {
        // print("FEB");
        feb++;
      } else if (dt > 1614549601000 && dt < 1617184799000) {
        // print("MAR");
        mar++;
      } else if (dt > 1617228001000 && dt < 1619863199000) {
        // print("APR");
        apr++;
      } else if (dt > 1619820001000 && dt < 1622455199000) {
        // print("MAY");
        may++;
      } else if (dt > 1622498401000 && dt < 1625047199000) {
        // print("JUN");
        jun++;
      } else if (dt > 1625090401000 && dt < 1627725599000) {
        // print("JUL");
        jul++;
      } else if (dt > 1627768801000 && dt < 1630403999000) {
        // print("Aug");
        aug++;
      } else if (dt > 1630447201000 && dt < 1633082399000) {
        // print("SEP");
        sep++;
      } else if (dt > 1633039201000 && dt < 1635674399000) {
        // print("OCT");
        oct++;
      } else if (dt > 1635717601000 && dt < 1638352799000) {
        // print("NOV");
        nov++;
      } else if (dt > 1638309601000 && dt < 1640944799000) {
        // print("DEC");
        dec++;
      }
// if (minTime < dt.millisecondsSinceEpoch) {
//   minTime = dt.millisecondsSinceEpoch;
//   minTimeIndex = times[i];
// } else if (dt.millisecondsSinceEpoch > maxTime) {
//   maxTime = dt.millisecondsSinceEpoch;
//   maxTimeIndex = times[i];
// }
    }

    print("JAN" + jan.toString());
    print("FEB" + feb.toString());
    print("MAR" + mar.toString());
    print("APR" + apr.toString());
    print("MAY" + may.toString());
    print("JUN" + jun.toString());
    print("JUL" + jul.toString());
    print("AUG" + aug.toString());
    print("SEP" + sep.toString());
    print("OCT" + oct.toString());
    print("NOV" + nov.toString());
    print("DEC" + dec.toString());
// print("MMMMMMMM INDEX " + minTimeIndex.toString());
// print("MMMMMMMM  " + minTime.toString());
// print("XXXXXXXX INDEX  " + maxTimeIndex.toString());
// print("XXXXXXXX  " + maxTime.toString());
  }
}
