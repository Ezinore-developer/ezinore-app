import 'dart:developer';

import 'package:ezinore_app/accountflow/aboutEzinore.dart';
import 'package:ezinore_app/accountflow/aboutSparko.dart';
import 'package:ezinore_app/accountflow/editContactInfoScreen.dart';
import 'package:ezinore_app/accountflow/faq.dart';
import 'package:ezinore_app/accountflow/maintenanceDiaryScreen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String greeting = "Good Night";
  String name = "Nirmal Yadav";
  String uin = "#987654321";
  String idandt = "12/05/23 : 12:00:00 pm";
  int batteryCapacity = 8;
  int generationCapacity = 8;

  final _email = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.s,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                        radius: 70.0,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(greeting,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                          fontFamily: 'Supreme',
                          fontWeight: FontWeight.w700,
                          height: 1.14,
                          letterSpacing: -0.42,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 25),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditContactInfo()));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text("Email Address",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.1)),
                    ),
                    const SizedBox(height: 20),
                    Text("Phone Number",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _phoneNumber,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.1)),
                    ),
                    const SizedBox(height: 20),
                    Text("Address",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _address,
                      maxLines: 2,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.1)),
                    ),
                  ],
                ),
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
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.s,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About My Sparko",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text("Uniqe Identification Number",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 18)),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      uin,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(),
                    ),
                    Text(
                      "Installation Date & Time",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      idandt,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(),
                    ),
                    Text(
                      "Installed Battery Capacity",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "$batteryCapacity Kwh",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(),
                    ),
                    Text(
                      "Installed Generation Capcity",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "$generationCapacity Kwh",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Maintenance Diary",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MaintenanceDiaryScreen()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.black.withOpacity(0.5),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About Sparko",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutSparko()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                            color: Colors.black.withOpacity(0.5),
                          ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About Ezinore",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AboutEzinore()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                            color: Colors.black.withOpacity(0.5),
                          ))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Frequently Asked Questions",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Faq()));
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                            color: Colors.black.withOpacity(0.5),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How are we doing?",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.black.withOpacity(0.5),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Help Center",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.black.withOpacity(0.5),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
