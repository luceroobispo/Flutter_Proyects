import 'package:flutter/material.dart';

void messageResponse(BuildContext context, String name, String message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(canvasColor: Colors.orange),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            title: const Text("Nuevos cambios..."),
            content: Text("La persona $name $message"),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.pop(context, name); // Pop the screen
                },
              ),
            ],
          ),
        );
      });
}
