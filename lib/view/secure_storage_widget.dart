import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageWidget extends StatefulWidget {
  const SecureStorageWidget({Key? key}) : super(key: key);

  @override
  SecureStorageWidgetState createState() => SecureStorageWidgetState();
}

class Content {
  String key;
  String value;

  Content(this.key, this.value);
}

class SecureStorageWidgetState extends State<SecureStorageWidget> {
  final storage = const FlutterSecureStorage();
  String? _key;
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
    const Text(
      "SecureStorage",
      style: TextStyle(fontSize: 20),
    ),
    TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.face),
        // hintText: '年齢を入力してください',
        labelText: 'key',
      ),
      onChanged: (value) {
        _key = value;
      },
      onSubmitted: (value) {
        _key = value;
      },
    ),
    TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.face),
        // hintText: '年齢を入力してください',
        labelText: 'value',
      ),
      onChanged: (value) {
        _value = value;
      },
      onSubmitted: (value) {
        _value = value;
      },
    ),
    TextButton(
      onPressed: () async {
        if (_key == null || _value == null) {
          return;
        }
        await storage.write(key: _key!, value: _value!);
      },
      child: const Text("Secure_storageに保存"),
    ),
    TextButton(
      onPressed: () async {
        Map<String, String> map = await storage.readAll();
        List<Content> contents =
            map.entries.map((e) => Content(e.key, e.value)).toList();

        showModalBottomSheet(
          // isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: (contents.isEmpty)?const Text("Nothing"):ListView.builder(
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "key:${contents[index].key}",
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("value:${contents[index].value}",
                          overflow: TextOverflow.ellipsis),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      child: const Text("リストを表示"),
    ),
    TextButton(
      onPressed: ()async {
        await storage.deleteAll();
      },
      child: const Text("リストを削除"),
    ),
      ],
    );
  }
}
