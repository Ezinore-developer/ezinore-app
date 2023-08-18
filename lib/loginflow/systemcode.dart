import 'package:ezinore_app/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SystemCodeScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const SystemCodeScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<SystemCodeScreen> createState() => _SystemCodeScreenState();
}

class _SystemCodeScreenState extends ConsumerState<SystemCodeScreen> {
  final _codeController = TextEditingController();
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
                        "8/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("System Code",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 32),
                      Text("Enter System Code",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).setSystemCode(_codeController.text);
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
