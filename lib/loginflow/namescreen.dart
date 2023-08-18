import 'package:ezinore_app/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class NameScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  const NameScreen({super.key, required this.onClick});

  @override
  ConsumerState<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  @override
  void initState() {
    super.initState();

    _firstName.text = ref.read(userProvider).firstName!;
    _lastName.text = ref.read(userProvider).lastName!;
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 32),
                    Text("First Name",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(controller: _firstName),
                    const SizedBox(height: 20),
                    Text("Last Name",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(controller: _lastName),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).setFirstName(_firstName.text.trim());
                    ref.read(userProvider).setLastName(_lastName.text.trim());
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
