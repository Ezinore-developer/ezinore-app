import 'package:flutter/material.dart';

class BookSessionFormScreen extends StatefulWidget {
  const BookSessionFormScreen({super.key});

  @override
  State<BookSessionFormScreen> createState() => _BookSessionFormScreenState();
}

class _BookSessionFormScreenState extends State<BookSessionFormScreen> {
  final _name = TextEditingController(text: "Nirmal Yadav");
  final _phone = TextEditingController(text: "+91 9876543219");
  final _address =
      TextEditingController(text: "St no: 2A, Qrs. No: 001 Delhi, 110089");

  bool cleaning = false;
  bool servicing = false;

  int cleaningPrice = 0;
  int servicingPrice = 0;

  final List<Map<String, dynamic>> dates = [
    {"day": "Mon", "date": 01},
    {"day": "Tue", "date": 02},
    {"day": "Wed", "date": 03},
    {"day": "Thurs", "date": 04},
  ];

  final List<String> times = ["10:00 AM", "11:00 AM", "12:00 AM"];

  int selectedDateIndex = -1;
  int selectedTimeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Book a session",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Text("Name" , style: ,)
                      Text("Name",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1)),
                      ),
                      const SizedBox(height: 20),
                      Text("Phone Number",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _phone,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1)),
                      ),
                      Text("Address",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _address,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1)),
                        maxLines: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(
                          color: Colors.black.withOpacity(0.1),
                          thickness: 1.5,
                        ),
                      ),
                      Text(
                        "Services Required",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ListTile(
                        leading: Checkbox(
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            if (value!) {
                              cleaningPrice = 300;
                            } else {
                              cleaningPrice = 0;
                            }

                            setState(() {
                              cleaning = value;
                            });
                          },
                          value: cleaning,
                        ),
                        title: const Text("Cleaning"),
                        trailing: const Text("₹300"),
                      ),
                      ListTile(
                        leading: Checkbox(
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          onChanged: (bool? value) {
                            if (value!) {
                              servicingPrice = 399;
                            } else {
                              servicingPrice = 0;
                            }
                            setState(() {
                              servicing = value!;
                            });
                          },
                          value: servicing,
                        ),
                        title: const Text("Servicing"),
                        trailing: const Text("₹399"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(
                          color: Colors.black.withOpacity(0.1),
                          thickness: 1.5,
                        ),
                      ),
                      Text(
                        "Select a Date",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ListView.builder(
                            itemCount: dates.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDateIndex == index
                                        ? selectedDateIndex = -1
                                        : selectedDateIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150),
                                  width: 60,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 16),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      border: Border.all(
                                          color: selectedDateIndex == index
                                              ? Colors.black
                                              : Colors.transparent),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(dates[index]['day'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(dates[index]['date'].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(
                          color: Colors.black.withOpacity(0.1),
                          thickness: 1.5,
                        ),
                      ),
                      Text(
                        "Select a Time",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ListView.builder(
                            itemCount: times.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTimeIndex == index
                                        ? selectedTimeIndex = -1
                                        : selectedTimeIndex = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  duration: const Duration(milliseconds: 150),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      border: Border.all(
                                          color: selectedTimeIndex == index
                                              ? Colors.black
                                              : Colors.transparent),
                                      borderRadius:
                                          BorderRadius.circular(100.0)),
                                  child: Text(times[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 140,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: Column(children: [
                  Visibility(
                    visible: cleaningPrice + servicingPrice != 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Charges",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "₹${cleaningPrice + servicingPrice}",
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                      onPressed:
                          cleaningPrice + servicingPrice == 0 ? null : () {},
                      child: const Text("Confirm Session"))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
