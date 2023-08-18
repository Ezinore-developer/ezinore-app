import 'package:ezinore_app/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddressScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const AddressScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  final _zipCode = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _country = TextEditingController(text: "India");

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
                        "5/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 32),
                    Text("Zip Code",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                        controller: _zipCode,
                        keyboardType: TextInputType.number),
                    const SizedBox(height: 20),
                    Text("City/Disctrict",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                        controller: _city, keyboardType: TextInputType.text),
                    const SizedBox(height: 16),
                    Text("State",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                        controller: _state, keyboardType: TextInputType.text),
                    const SizedBox(height: 16),
                    Text("Country",
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 16),
                    TextField(
                        controller: _country, keyboardType: TextInputType.text),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).setAddress(
                        "${_zipCode.text}, ${_city.text}, ${_state.text}, ${_country.text}");
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
