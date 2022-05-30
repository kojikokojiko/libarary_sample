import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class AdaptiveDialogWidget extends StatefulWidget {
  const AdaptiveDialogWidget({Key? key}) : super(key: key);

  @override
  AdaptiveDialogWidgetState createState() => AdaptiveDialogWidgetState();
}

class AdaptiveDialogWidgetState extends State<AdaptiveDialogWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Adaptive_Dialog",
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
            onPressed: () {
              showOkAlertDialog(
                  context: context, title: "title", message: "message");
            },
            child: const Text("OK")),
        TextButton(
            onPressed: () {
              showConfirmationDialog(
                  context: context,
                  title: "title",
                  message: "message",
                  actions: const [
                    AlertDialogAction(key: 1, label: "Action1"),
                    AlertDialogAction(key: 2, label: "Action2"),
                    AlertDialogAction(key: 3, label: "Action3"),
                    AlertDialogAction(key: 4, label: "Action4"),
                  ]);
            },
            child: const Text("Confirm")),
        TextButton(onPressed: (){
          showModalActionSheet(context: context,title: "title",message: "message");

        }, child: const Text("showModalActionSheet"))
      ],
    );
  }
}
