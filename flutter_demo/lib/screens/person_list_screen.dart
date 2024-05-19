import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/add_person_screen.dart';
import 'package:flutter_demo/screens/edit_person_screen.dart';

class PersonListScreen extends StatefulWidget {
  const PersonListScreen({super.key});

  @override
  State<PersonListScreen> createState() => _PersonListScreenState();
}

class _PersonListScreenState extends State<PersonListScreen> {
  List people = ["Carmen", "Luis", "Francisco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter demo"),
      ),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(people[index]),
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditPersonScreen(name: people[index])))
                    .then((newPerson) {
                  if (newPerson != null) {
                    people[index] = newPerson;
                    setState(() {
                      people = people;
                    });
                  }
                });
              },
              onLongPress: () {},
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddPersonScreen(
                        updateList: (name) {
                          people.add(name);
                          setState(() {
                            people = people;
                          });
                        },
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
