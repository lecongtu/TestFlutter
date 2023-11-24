import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.searchTask});

  final Function searchTask;

  void handleOnChangeText(String name) {
    searchTask(name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRect(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 70,
                ),
              ),
              const Text(
                'Good morning Lctu',
                style: TextStyle(fontFamily: 'Regular', fontSize: 16),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff000000).withOpacity(0.4),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.search,
                        color: Color(0xffDFBD43),
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) => handleOnChangeText(value),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search by Name",
                          hintStyle: TextStyle(
                              color: const Color(0xff000000).withOpacity(0.5)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          isDense: true,
                        ),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff000000),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
