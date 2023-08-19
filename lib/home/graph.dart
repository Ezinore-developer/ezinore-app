import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}

class DoughnutData {
  DoughnutData({required this.color, required this.x, required this.y});
  final String x;
  final double y;
  final Color color;
}

class _GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData1 = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 0),
      ChartData(2013, 32),
      ChartData(2014, 60)
    ];

    final List<ChartData> chartData2 = [
      ChartData(2010, 0),
      ChartData(2011, 34),
      ChartData(2012, 10),
      ChartData(2013, 70),
      ChartData(2014, 23)
    ];

    final List<DoughnutData> chartData = [
      DoughnutData(x: 'David', y: 1, color: Colors.red),
      DoughnutData(x: 'Steve', y: 1, color: Colors.blue),
      DoughnutData(x: 'Jack', y: 1, color: Colors.green),
      DoughnutData(x: 'Others', y: 1, color: Colors.yellow)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Graphs"),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: SfCircularChart(
            // legend: Legend(isVisible: true , alignment: ChartAlignment.center),
            series: [
              DoughnutSeries<DoughnutData, String>(
                
                  dataSource: chartData,
                  pointColorMapper: (DoughnutData data, _) => data.color,
                  xValueMapper: (DoughnutData data, _) => data.x,
                  yValueMapper: (DoughnutData data, _) => data.y)
            ],
          ),
          // child: SfCartesianChart(
          //     backgroundColor: Colors.white,
          //     series: <ChartSeries>[
          //       LineSeries<ChartData, int>(
          //         color: Colors.purple,
          //           dataSource: chartData1,
          //           xValueMapper: (ChartData data, _) => data.x,
          //           yValueMapper: (ChartData data, _) => data.y),
          //       LineSeries<ChartData, int>(
          //         color: Colors.orange,
          //           dataSource: chartData2,
          //           xValueMapper: (ChartData data, _) => data.x,
          //           yValueMapper: (ChartData data, _) => data.y)
          //     ]),
        ),
      ),
    );
  }
}
