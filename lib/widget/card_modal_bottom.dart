import 'package:flutter/material.dart';

class ModalBottom extends StatefulWidget {
  const ModalBottom({super.key, required this.addTask});

  final Function addTask;

  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  String valueText = '';

  void handleOnClickAddButton(BuildContext context) {
    if (valueText.isEmpty) {
      return;
    }
    widget.addTask(valueText);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                valueText = text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Input your task'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => handleOnClickAddButton(context),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
              child: const Text("Input value"),
            )
          ],
        ),
      ),
    );
  }
}
