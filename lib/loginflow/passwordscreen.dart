import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/userProvider.dart';

// ignore: must_be_immutable
class PasswordScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const PasswordScreen({super.key, required this.onClick , required this.onClickBack});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final _enterPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  
   @override
  void initState() {
    super.initState();

    _enterPassword.text = ref.read(userProvider).password!;
    _confirmPassword.text = ref.read(userProvider).password!;
  }

  
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
                        "9/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 32),
                    Text("Enter Password",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(controller: _enterPassword),
                    const SizedBox(height: 20),
                    Text("Confirm Password",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(controller: _confirmPassword),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: widget.onClick,
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
