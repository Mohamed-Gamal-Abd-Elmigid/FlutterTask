import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:task/Pages/orders/ordersviewmodel.dart';

class OrdersScene extends StatelessWidget {
  const OrdersScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => OrdersView(),
      viewModel: OrdersViewModel(),
    );
  }
}

class OrdersView extends HookView<OrdersViewModel> {
  @override
  Widget render(BuildContext context, OrdersViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          "First Screen",
        ),
      ),
    );
  }
}
