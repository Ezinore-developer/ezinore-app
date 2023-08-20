import 'package:ezinore_app/home/booksessionform.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How can we help you?",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Frequently Asked Questions",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Find quick answers to commonly raised questions about our product/service to resolve your queries efficiently.",
                      style: textTheme.bodyMedium,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Get in touch",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "You have a unique problem. Get in touch with us, we will help you to resolve it.",
                      style: textTheme.bodyMedium,
                    ),
                  ]),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cleanind and Servicing",
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "You need cleaning of solar panels or having issues with the system. Book a session with us  and we will take care of the rest.",
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BookSessionFormScreen()));
                        },
                        child: const Text("Book a session"))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
