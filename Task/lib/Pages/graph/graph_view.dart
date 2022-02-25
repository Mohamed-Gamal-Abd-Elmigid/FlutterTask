import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:task/Pages/graph/graph_viewmodel.dart';

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => GraphView(),
      viewModel: GraphViewModel(),
    );
  }
}

class GraphView extends HookView<GraphViewModel> {
  @override
  Widget render(BuildContext context, GraphViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text("Graph"),
      ),
    );
  }
}
