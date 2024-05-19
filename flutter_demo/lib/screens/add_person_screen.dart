import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/message_response.dart';

class AddPersonScreen extends StatelessWidget {
  AddPersonScreen({super.key, required this.updateList});

  final TextEditingController _controller = TextEditingController();
  final Function updateList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Person"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: false, // hide the text for passwords
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a name";
                }
                return null;
              },
              controller: _controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String name = _controller.text;
            updateList(name);
            messageResponse(context, name, "has been added");
          },
          child: const Icon(Icons.save),
        ));
  }
}
