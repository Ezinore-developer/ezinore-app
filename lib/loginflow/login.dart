import 'package:ezinore_app/providers/userProvider.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class LoginScreen extends ConsumerStatefulWidget {
  final VoidCallback onClickBack;
  const LoginScreen({super.key, required this.onClickBack});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
                        "10/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 32),
                    Text(
                      "Confirm Login",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final auth = Auth();
                    final res = auth.registerUser(
                      email: ref.read(userProvider).email!,
                      fullName:
                          "${ref.read(userProvider).firstName!} ${ref.read(userProvider).lastName!}",
                      password: ref.read(userProvider).password!,
                      gender: ref.read(userProvider).gender!,
                      phoneNo: ref.read(userProvider).phone!,
                      dob: ref.read(userProvider).dob!,
                      idProof: ref.read(userProvider).idProof!,
                      systemCode: ref.read(userProvider).systemCode!,
                    );


                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(res.toString()),
                      ),
                    );
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
