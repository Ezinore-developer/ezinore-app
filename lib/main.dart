import 'dart:developer';

// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:ezinore_app/amplifyconfiguration.dart';
// import 'package:ezinore_app/home/graph.dart';
import 'package:ezinore_app/home/root.dart';
import 'package:ezinore_app/loginflow/root.dart';
// import 'package:ezinore_app/providers/userProvider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:ezinore_app/amplifyconfiguration.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _configureAmplify();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const ProviderScope(child: MyApp()));
}

// Future<void> _configureAmplify() async {
//   Amplify.addPlugins([AmplifyAuthCognito()]);
//   // AmplifyAuthCognito authPlugin = AmplifyAuthCognito();

//   try {
//     await Amplify.configure(amplifyconfig);
//   } catch (e) {
//     log('amplify already confgiured');
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
            labelColor: Color(0xFF062125),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFF062125))),
        primarySwatch: Colors.amber,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none,
          ),
        ),
        textTheme: TextTheme(
          displaySmall: TextStyle(
            color: Colors.black.withOpacity(0.6000000238418579),
            fontSize: 16,
            fontFamily: 'Supreme',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.56,
          ),
          labelLarge: const TextStyle(
            color: Color(0xFF062125),
            fontSize: 18,
            fontFamily: 'Supreme',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.63,
          ),
          titleSmall: const TextStyle(
            color: Color(0xFF062125),
            fontSize: 18,
            fontFamily: 'Aspekta',
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            color: Colors.white.withOpacity(0.6000000238418579),
            fontSize: 18,
            fontFamily: 'Supreme',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.63,
          ),
          titleMedium: const TextStyle(
            color: Color(0xFF062125),
            fontSize: 21,
            fontFamily: 'Aspekta',
            fontWeight: FontWeight.w700,
          ),
        ),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            fixedSize: MaterialStateProperty.resolveWith(
                (states) => const Size(328, 50)),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            elevation: 0,
            backgroundColor: const Color(0xFFF4B931),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return const HomeRoot();
      //     } else {
      //       return const LoginRoot();
      //     }
      //   },
      // ),
      home: HomeRoot(),
    );
  }
}
