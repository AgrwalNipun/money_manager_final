import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager_final/providerr.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
//I HOPE THIS GETS UPLOADED TO GIT
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.green,
  ));
  runApp(
      ChangeNotifierProvider(create: (context) => Providerr(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // appBarTheme: AppBarTheme(backgroundColor: Colors.black),

        // scaffoldBackgroundColor: const Color.fromARGB(255, 216, 255, 254),
        // primaryColor: Color.fromARGB(255, 78, 191, 181),
        // secondaryHeaderColor: Color.fromARGB(255, 136, 226, 218),
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: const Color.fromARGB(255, 69, 66, 74),
        // ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
