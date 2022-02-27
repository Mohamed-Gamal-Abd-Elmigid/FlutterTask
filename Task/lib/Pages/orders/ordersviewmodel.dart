// ignore: file_names
import 'dart:convert';
import 'package:task/Extintions/parsedouble.dart';
import 'package:flutter/services.dart';
import 'package:pmvvm/view_model.dart';
import 'package:task/models/FlapKapModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OrdersViewModel extends ViewModel {
  bool _showContent = false;

  bool get showContent => _showContent;

  bool _showGraph = false;

  bool get showGraph => _showGraph;

  List<FlapKap>? flapKapItems;
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

  @override
  void init() {
    super.init();
    loadJsonData();
  }

  Future<List<FlapKap>> loadJsonData() async {
    _showContent = false;
    EasyLoading.show();
    var jsonData = await rootBundle.loadString('assets/jsonFile/orders.json');
    EasyLoading.dismiss();
    final flapKapList = json.decode(jsonData) as List<dynamic>;
    flapKapItems = flapKapList.map((e) => FlapKap.fromJson(e)).toList();
    for (int i = 0; i < flapKapItems!.length; i++) {
      millions.add(flapKapList[i]["price"].substring(1, 2));
      prices.add(flapKapList[i]["price"].substring(3));
      times.add(flapKapList[i]["registered"].substring(0, 18));
      if (flapKapList[i]['status'] == "RETURNED") {
        returns.add(flapKapList[i]['status']);
      }
    }
    getGraphPoints(times);
    double totalMillions = calculateMillions(millions);
    double totalThousands = calculateThousands(prices);
    calculateAveragePrices(totalMillions, totalThousands, prices.length);
    _showContent = true;
    notifyListeners();
    return flapKapList.map((e) => FlapKap.fromJson(e)).toList();
  }

  calculateAveragePrices(double million, double thousand, int length) {
    finalMil = (million + thousand) / length;
  }

  double calculateMillions(List<String> million) {
    double sum = 0;
    int mil = 0;
    for (var item in million) {
      mil = item.convToInt();
      sum += mil;
    }
    sum = sum * 1000000;
    return sum;
  }

  double calculateThousands(List<String> price) {
    double sum = 0.0;
    double thous = 0.0;
    for (var item in price) {
      String newItem = item.replaceAll(",", ".");
      thous = newItem.toDouble();
      sum += thous;
    }
    return sum;
  }

  getSeconds(String time) {
    final timeStr = time;
    final format = DateFormat("yyyy-MM-ddTHH:mm:ss");
    final dt = format.parse(timeStr).millisecondsSinceEpoch;
  }

  getGraphPoints(List<String> times) {
    for (int i = 0; i < times.length; i++) {
      final timeStr = times[i];
      final format = DateFormat("yyyy-MM-ddTHH:mm:ss");
      final dt = format.parse(timeStr).millisecondsSinceEpoch;
      _showGraph = true;
      notifyListeners();
      if (dt > 1609452001000 && dt < 1612087199000) {
        jan++;
      } else if (dt > 1612130401000 && dt < 1614506399000) {
        feb++;
      } else if (dt > 1614549601000 && dt < 1617184799000) {
        mar++;
      } else if (dt > 1617228001000 && dt < 1619863199000) {
        apr++;
      } else if (dt > 1619820001000 && dt < 1622455199000) {
        may++;
      } else if (dt > 1622498401000 && dt < 1625047199000) {
        jun++;
      } else if (dt > 1625090401000 && dt < 1627725599000) {
        jul++;
      } else if (dt > 1627768801000 && dt < 1630403999000) {
        aug++;
      } else if (dt > 1630447201000 && dt < 1633082399000) {
        sep++;
      } else if (dt > 1633039201000 && dt < 1635674399000) {
        oct++;
      } else if (dt > 1635717601000 && dt < 1638352799000) {
        nov++;
      } else if (dt > 1638309601000 && dt < 1640944799000) {
        dec++;
      }
    }
  }
}
