import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:task/Pages/orders/ordersviewmodel.dart';

import '../../Widgets/cardItem.dart';

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
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.height * 0.04,
              ),
              CardItem(
                title: "Total Account",
                count: "${viewModel.flapKapItems!.length}",
              ),
              SizedBox(
                height: mediaQuery.height * 0.04,
              ),
              CardItem(
                title: "Average Price",
                count: "${viewModel.finalMil}",
              ),
              SizedBox(
                height: mediaQuery.height * 0.04,
              ),
              CardItem(
                title: "Number Of Returns",
                count: "${viewModel.returns.length}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
