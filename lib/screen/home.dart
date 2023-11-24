import 'package:flutter/material.dart';
import '../Model/DataItem.dart';
import '../widget/card_body_widget.dart';
import '../widget/card_modal_bottom.dart';
import '../widget/header_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<DataItem> items = [
    DataItem(id: "1", title: "Go to church"),
    DataItem(id: "2", title: "Cook for the family"),
    DataItem(id: "3", title: "Wash my clothes"),
    DataItem(id: "4", title: "Visit Chartity"),
    DataItem(id: "5", title: "Make my hair"),
  ];

  List<DataItem> findData = [];

  void handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  void handleAddTask(String name) {
    final newItem = DataItem(id: DateTime.now().toString(), title: name);
    setState(() {
      items.add(newItem);
    });
  }

  void handleSearchTask(String name) {
    List<DataItem> results = [];
    if (name.isEmpty) {
      results = items;
    } else {
      items.forEach((element) {
        if (element.title.contains(name)) {
          results.add(element);
        }
      });
    }
    setState(() {
      findData = results;
    });
  }

  @override
  void initState() {
    findData = items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidget(searchTask: handleSearchTask),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Today Task",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Column(
                children: findData
                    .map((item) =>
                        CardBody(item: item, handleDelete: handleDeleteTask))
                    .toList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext content) {
              return ModalBottom(addTask: handleAddTask);
            },
          );
        },
      ),
    );
  }
}
