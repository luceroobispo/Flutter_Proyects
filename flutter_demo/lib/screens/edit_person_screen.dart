import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/message_response.dart';

class EditPersonScreen extends StatefulWidget {
  const EditPersonScreen({super.key, required this.name});

  final String name;

  @override
  State<EditPersonScreen> createState() => _EditPersonScreen();
}

class _EditPersonScreen extends State<EditPersonScreen> {
  late TextEditingController _controllerName;

  @override
  void initState() {
    String name = widget.name;
    _controllerName = TextEditingController(text: name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Person"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                  controller: _controllerName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name")),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  String name = _controllerName.text;

                  if (name.isNotEmpty) {
                    messageResponse(context, name, "has been updated");
                  }
                },
                child: const Text("Save"),
              )
            ],
          ),
        ));
  }
}
