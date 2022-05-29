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
    return Column(
      children: [
        Text("flutter_keyboard_visibility",style: TextStyle(fontSize: 20),),
        KeyboardVisibilityBuilder(
          builder: (BuildContext context, bool isKeyboardVisible) {
            return Container(
              child: Column(
                children: [
                  Text("判定"),
                  (isKeyboardVisible) ? Text("キーボードON",style: TextStyle(color: Colors.red),) : Text("キーボードOFF",style: TextStyle(color: Colors.blue),),
                  const SizedBox(height: 16,),
                  KeyboardDismissOnTap(
                      dismissOnCapturedTaps: true,
                      child: Container(
                        color: Colors.grey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: Text("ここをタップすると、キーボードが消えるよ"),
                            ),


                            TextField(
                              decoration: InputDecoration(
                                labelText: "テキストフィールド",
                                // label: ,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  )

                ],
              ),
            );
          },
        ),
      ],
    );
  }
}