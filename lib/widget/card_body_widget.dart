import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardBody extends StatefulWidget {
  CardBody({Key? key, required this.item, required this.handleDelete})
      : super(key: key);

  var item;
  final Function handleDelete;

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                  value: isChecked,
                  activeColor: Colors.orangeAccent,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  }),
              Text(
                widget.item.title,
                style: TextStyle(
                    decoration: isChecked! ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              if (await confirm(
                context,
                title: const Text('Confirm'),
                content: const Text('Would you like to remove?'),
                textOK: const Text('Yes'),
                textCancel: const Text('No'),
              )) {
                return widget.handleDelete(widget.item.id);
              }
              return print('pressedCancel');
            },
            child: const Icon(Icons.delete_outline),
          )
        ],
      ),
    );
  }
}
