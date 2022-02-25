import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/Contifigirations/page_route_name.dart';
import 'package:task/Pages/orders/orders_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const OrdersScene(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const OrdersScene(), settings: settings);
    }
  }
}