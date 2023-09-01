import 'package:flutter/material.dart';

class EditContactInfo extends StatefulWidget {
  const EditContactInfo({super.key});

  @override
  State<EditContactInfo> createState() => _EditContactInfoState();
}

class _EditContactInfoState extends State<EditContactInfo> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 27.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF4B931),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Color(0xFF062125),
                          fontSize: 18,
                          fontFamily: 'Supreme',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.63,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Edit Contact Information",
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 32),
                  Text("Name", style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
                  ),
                  const SizedBox(height: 20),
                  Text("Email Address",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
                  ),
                  const SizedBox(height: 20),
                  Text("Phone Number",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _password,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
                  ),
                  const SizedBox(height: 20),
                  Text("Address",
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 2,
                    controller: _address,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.black.withOpacity(0.1)),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
