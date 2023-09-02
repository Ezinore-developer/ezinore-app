import 'package:flutter/material.dart';

class AboutEzinore extends StatelessWidget {
  const AboutEzinore({super.key});

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
                        "About Ezinore",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "A comprehensive solution to meet all your energy needs, including generation, storage, and management. Our goal is to revolutionise today's power grid system with the help of an all-in-one sustainable solution that seamlessly embeds itself into the existing infrastructure.",
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
