import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:task/Pages/orders/ordersviewmodel.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => GraphView(),
      viewModel: OrdersViewModel(),
    );
  }
}

class GraphView extends HookView<OrdersViewModel> {
  @override
  Widget render(BuildContext context, OrdersViewModel viewModel) {
    final List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];

    final mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaQuery.height / 1.1,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            color: const Color(0xff020227),
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 12,
                  minY: 0,
                  maxY: 20,
                  titlesData: LineTitles.getTitleData(),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: const Color(0xff37434d),
                        strokeWidth: 1,
                      );
                    },
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: const Color(0xff37434d),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border:
                        Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 0),
                        FlSpot(1, viewModel.jan.toDouble()),
                        FlSpot(2, viewModel.feb.toDouble()),
                        FlSpot(3, viewModel.mar.toDouble()),
                        FlSpot(4, viewModel.apr.toDouble()),
                        FlSpot(5, viewModel.may.toDouble()),
                        FlSpot(6, viewModel.jun.toDouble()),
                        FlSpot(7, viewModel.jul.toDouble()),
                        FlSpot(8, viewModel.aug.toDouble()),
                        FlSpot(9, viewModel.sep.toDouble()),
                        FlSpot(10, viewModel.oct.toDouble()),
                        FlSpot(11, viewModel.nov.toDouble()),
                        FlSpot(12, viewModel.dec.toDouble()),
                      ],
                      isCurved: true,
                      colors: gradientColors,
                      barWidth: 5,
                      belowBarData: BarAreaData(
                        show: true,
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JA';
              case 2:
                return 'FE';
              case 3:
                return 'MA';
              case 4:
                return 'AP';
              case 5:
                return 'MA';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AU';
              case 9:
                return 'SE';
              case 10:
                return 'OC';
              case 11:
                return 'NO';
              case 12:
                return 'DE';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1';
              case 2:
                return '2';
              case 3:
                return '3';
              case 4:
                return '4';
              case 5:
                return '5';
              case 6:
                return '6';
              case 7:
                return '7';
              case 8:
                return '8';
              case 9:
                return '9';
              case 10:
                return '10';
              case 11:
                return '11';
              case 12:
                return '12';
              case 13:
                return '13';
              case 14:
                return '14';
              case 15:
                return '15';
              case 10:
                return '10';
              case 10:
                return '10';
            }
            return '';
          },
          reservedSize: 30,
          margin: 10,
        ),
      );
}
