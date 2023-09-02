import 'package:flutter/material.dart';

class AboutSparko extends StatelessWidget {
  const AboutSparko({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 27.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Column(
                    // mainAxisAlignment: Main,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Sparko",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "'Sparko' is an all-in-one solution to store and manage clean energy. It seamlessly integrates with solar panels and the grid, using artificial intelligence algorithms to analyze energy consumption patterns and weather conditions of the future to save your energy. It comes with an app that allows you to monitor and control the flow of energy.",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
