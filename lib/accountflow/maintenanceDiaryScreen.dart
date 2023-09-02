import 'package:flutter/material.dart';

class MaintenanceDiaryScreen extends StatefulWidget {
  const MaintenanceDiaryScreen({super.key});

  @override
  State<MaintenanceDiaryScreen> createState() => _MaintenanceDiaryScreenState();
}

class _MaintenanceDiaryScreenState extends State<MaintenanceDiaryScreen> {
  int length = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Maintenance Diary",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),

                    for (int i = 0; i < length; i++)

                      // SizedBox(
                      //   height: 900,
                      //   child: ListView.separated(
                      //     physics: NeverScrollableScrollPhysics(),
                      //       itemBuilder: (context, index) {
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                               Text("After 6 Months of Installation" , style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.grey, ),),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black.withOpacity(0.5),
                                    size: 20,
                                  ))
                            ],
                          ),
                          if (i != length - 1)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Divider(),
                            )
                        ],
                      ),
                    //       },
                    //       separatorBuilder: (context, index) {

                    //       },
                    //       itemCount: length),
                    // )
                  ]),
            )
          ]),
        ),
      )),
    );
  }
}
