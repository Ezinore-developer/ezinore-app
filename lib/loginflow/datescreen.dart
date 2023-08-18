import 'package:ezinore_app/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const DateScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends ConsumerState<DateScreen> {
  final _date = TextEditingController();
  // final _age = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _date.text = ref.read(userProvider).dob!;
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
                        "2/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Age", style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 32),
                    Text("Date of birth",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );

                        if (date != null) {
                          _date.text = DateFormat('dd/MM/yyyy').format(date);
                        }
                      },
                      controller: _date,
                      // readOnly: true,
                      // keyboardType: TextInputType.datetime,
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // _date.te/
                    ref.read(userProvider).setDob(_date.text);
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
