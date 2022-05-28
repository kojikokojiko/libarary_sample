import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_sample/view/adaptive_dialog.dart';
import 'package:library_sample/view/image_gallary_saver_widget.dart';
import 'package:library_sample/view/secure_storage_widget.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // This is required
      ],
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(), // This is required
        ),
      ),
      // theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SecureStorageWidget(),
              Divider(color: Colors.black,),
              ImageGallarySaverWidget(),
              Divider(color: Colors.black,),
              AdaptiveDialogWidget(),
              


            ],
          ),
        ),
      ),
    );
  }
}
