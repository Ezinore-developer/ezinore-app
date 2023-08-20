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

  final List<Map<String, dynamic>> dates = [
    {"day": "Mon", "date": 01},
    {"day": "Tue", "date": 02},
    {"day": "Wed", "date": 03},
    {"day": "Thurs", "date": 04},
  ];

  int selectedDateIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                  Text("Name", style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
                  ),
                  const SizedBox(height: 20),
                  Text("Phone Number",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
                  ),
                  Text("Address",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _address,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
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
                        setState(() {
                          cleaning = value!;
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
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                  border: Border.all(
                                      color: selectedDateIndex == index
                                          ? Colors.black
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
