import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/userProvider.dart';

class PaymentMethodScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const PaymentMethodScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<PaymentMethodScreen> createState() =>
      _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends ConsumerState<PaymentMethodScreen> {
  String method = "";

  List<Map<String, String>> methods = [
    {
      "title": "CAPX",
      "desc":
          "Make a one-time payment to acquire full ownership of the solar inverter and enjoy long-term benefits.",
    },
    {
      "title": "EMI",
      "desc":
          "Spread the cost of the solar inverter over installments, owning it while managing payments in fixed monthly amounts.",
    },
    {
      "title": "OPEX",
      "desc":
          "Pay a regular fee to access and use the solar inverter as a service without upfront ownership costs.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: widget.onClickBack,
                        child: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      Text(
                        "4/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payemet Method",
                        style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 20.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: methods.map<Widget>((e) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              method == e['title']!
                                  ? method = ""
                                  : method = e['title']!;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            margin: const EdgeInsets.only(bottom: 32.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: method == e['title']!
                                  ? const Color(0xFF062125)
                                  : Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e['title']!,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontSize: 18,
                                          color: method == e['title']
                                              ? Colors.white
                                              : Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  e['desc']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: method == e['title']
                                              ? Colors.white
                                              : Colors.grey),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    widget.onClick();
                  },
                  child: Text('Next',
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
