import 'package:ezinore_app/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// ignore: must_be_immutable
class IdProofScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const IdProofScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<IdProofScreen> createState() => _IdProofScreenState();
}

enum IdProof { aadhar, voter, pan, none }

class _IdProofScreenState extends ConsumerState<IdProofScreen> {
  // final _IdProof = TextEditingController();

  IdProof _idProof = IdProof.aadhar;

  @override
  void initState() {
    super.initState();

    if (ref.read(userProvider).gender != "") {
      _idProof = ref.read(userProvider).idProof == "IdProof.aadhar"
          ? IdProof.aadhar
          : ref.read(userProvider).idProof == "IdProof.voter"
              ? IdProof.voter
              : ref.read(userProvider).idProof == "IdProof.pan"
                  ? IdProof.pan
                  : IdProof.aadhar;
    } else {
      _idProof = IdProof.aadhar;
    }
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
                        "7/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ID Proof",
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 32),
                      Text("Select an ID proof",
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: 32),
                      DropdownButton(
                          isExpanded: true,
                          underline: const SizedBox(
                            height: 0,
                          ),
                          items: const [
                            DropdownMenuItem(
                                value: IdProof.aadhar, child: Text("Aadhar")),
                            DropdownMenuItem(
                                value: IdProof.voter, child: Text("Voter ID")),
                            DropdownMenuItem(
                                value: IdProof.pan, child: Text("PAN")),
                          ],
                          value: _idProof,
                          onChanged: (value) {
                            setState(() {
                              _idProof = value as IdProof;
                            });
                          }),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).setIdProof(_idProof.toString());
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
