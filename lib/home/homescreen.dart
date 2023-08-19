import 'package:ezinore_app/providers/userProvider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class DoughnutData {
  DoughnutData({required this.color, required this.x, required this.y});
  final String x;
  final double y;
  final Color color;
}

final List<DoughnutData> chartData = [
  DoughnutData(x: 'Panels', y: 60, color: const Color(0xfff4b931)),
  DoughnutData(x: 'Grid', y: 30, color: const Color(0xfffa6651)),
  DoughnutData(x: 'Sparko', y: 10, color: const Color(0xff1e96fc)),
  // DoughnutData(x: 'Others', y: 1, color: Colors.yellow)
];

dynamic series = [
  DoughnutSeries<DoughnutData, String>(
      dataSource: chartData,
      pointColorMapper: (DoughnutData data, _) => data.color,
      xValueMapper: (DoughnutData data, _) => data.x,
      yValueMapper: (DoughnutData data, _) => data.y)
];

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late DatabaseReference userRef;
  // final _tabController = TabController(length: 2, vsync: TickerProvider);
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    userRef = FirebaseDatabase.instance
        .ref('users/${ref.read(userProvider).systemCode}');
  }

  final int amount = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(
              height: 40.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.green],
                            stops: [0.25, 0.85])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Charge",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          "60%",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Temperature",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          "27°c",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(298, 32),
                        elevation: 0,
                        backgroundColor: Colors.black.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Details",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black),
                          ),
                          const Icon(Icons.keyboard_arrow_right_rounded)
                        ],
                      )),
                  const SizedBox(
                    height: 16.0,
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Saving Status",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        height: 400.0,
                        width: double.infinity,
                        child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              const Material(
                                child: TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Color(0xFF062125),
                                    tabs: [
                                      Tab(
                                        text: "Month",
                                      ),
                                      Tab(
                                        text: "Year",
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 300,
                                child: TabBarView(children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Energy Savings",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "Estimated Values",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                                const SizedBox(
                                                  height: 24.0,
                                                ),
                                                Text(
                                                  DateFormat.MMMM()
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                                Text(
                                                  '₹$amount',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: Colors.green),
                                                ),
                                                Text(
                                                  "Saved",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height: 150.0,
                                                    width: 150.0,
                                                    child: SfCircularChart(
                                                      series: series,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Divider(
                                          color: Colors.white
                                              .withOpacity(0.800000011920929),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
