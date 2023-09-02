import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  Faq({super.key});

  final List<Map<String, String>> _faqs = [
    {
      "q": "What are you trying to solve?",
      "a":
          "We are providing user with the ability to manage and utilize their energy effectively providing them with comprehensive solutions which empowers our customers to overcome grid dependency and reduce their electricity bills.",
    },
    {
      "q": "Why should we choose Ezinore?",
      "a":
          "You should choose ezinore as we provide real time monitoring and controls on your mobile, with easy integration and installation of renewable energy solutions. We have a scalable and modular design. With the help of AI based energy optimization, our system helps user to reduce their electricity bills to more than 40%.",
    },
    {
      "q": "How does SPARKO help in reducing my electricity bill?",
      "a":
          "We provide a single integrated platform that combines Artificial Intelligence, renewable energy solutions and energy storage technologies to optimize energy usage, reduce costs and promote sustainability.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      vertical: 32.0, horizontal: 20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Column(
                      // mainAxisAlignment: Main,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Frequently Asked Questions",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        for (var element in _faqs)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                element["q"].toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                element["a"].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                              ),
                              const SizedBox(
                                height: 24.0,
                              )
                            ],
                          )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
