import 'package:ezinore_app/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class GenderScreen extends ConsumerStatefulWidget {
  final VoidCallback onClick;
  final VoidCallback onClickBack;
  const GenderScreen(
      {super.key, required this.onClick, required this.onClickBack});

  @override
  ConsumerState<GenderScreen> createState() => _GenderScreenState();
}

enum Gender { male, female, others, none }

class _GenderScreenState extends ConsumerState<GenderScreen> {
  Gender selectedGender = Gender.none;

  final Map<Gender, String> genders = {
    Gender.none: "None",
    Gender.male: "Male",
    Gender.female: "Female",
    Gender.others: "Others",
  };

  @override
  void initState() {
    super.initState();

    if (ref.read(userProvider).gender != "") {
      selectedGender = genders.keys.firstWhere(
          (element) => genders[element] == ref.read(userProvider).gender);
    }
    else {
      selectedGender = Gender.none;
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 27.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: widget.onClickBack,
                        child: const Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      Text(
                        "3/10",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gender",
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 32),
                    GenderContainer(
                        onClick: () => setState(() => selectedGender =
                            selectedGender == Gender.male
                                ? Gender.none
                                : Gender.male),
                        value: "Male",
                        selected: selectedGender == Gender.male),
                    const SizedBox(height: 16),
                    GenderContainer(
                        onClick: () => setState(() => selectedGender =
                            selectedGender == Gender.female
                                ? Gender.none
                                : Gender.female),
                        value: "Female",
                        selected: selectedGender == Gender.female),
                    const SizedBox(height: 16),
                    GenderContainer(
                        onClick: () => setState(() => selectedGender =
                            selectedGender == Gender.others
                                ? Gender.none
                                : Gender.others),
                        value: "Others",
                        selected: selectedGender == Gender.others),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).setGender(genders[selectedGender]!);
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

// ignore: must_be_immutable
class GenderContainer extends StatefulWidget {
  VoidCallback onClick;
  String value;
  bool selected;
  GenderContainer(
      {super.key,
      required this.onClick,
      required this.value,
      required this.selected});

  @override
  State<GenderContainer> createState() => _GenderContainerState();
}

class _GenderContainerState extends State<GenderContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
        width: 328,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.selected ? const Color(0xFF062125) : Colors.white,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(widget.value,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: widget.selected
                          ? Colors.white
                          : const Color(0xFF062125),
                    )),
          ),
        ),
      ),
    );
  }
}
