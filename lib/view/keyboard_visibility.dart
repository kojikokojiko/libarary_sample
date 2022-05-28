import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/material.dart';

class KeyboardVisibility extends StatefulWidget {
  const KeyboardVisibility({Key? key}) : super(key: key);

  @override
  _KeyboardVisibilityState createState() => _KeyboardVisibilityState();
}

class _KeyboardVisibilityState extends State<KeyboardVisibility> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Icon(Icons.add),
          const SizedBox(height: 16,)

        ],
      )


    );
  }
}
