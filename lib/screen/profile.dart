import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/theme/theme.dart';
import 'package:to_do_list/theme/theme_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched = false;

  @override
  void initState() {
    if (Provider.of<ThemeProvider>(context, listen: false).themeData ==
        lightMode) {
      isSwitched = false;
    } else {
      isSwitched = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 200,
              ),
            ),
            const Text(
              'Le Cong Tu',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProfileListWidget(
                    title: 'Setting',
                    iconData: Icons.settings,
                  ),
                  ProfileListWidget(
                    title: 'Support',
                    iconData: Icons.support,
                  ),
                  ProfileListWidget(
                    title: 'Share',
                    iconData: Icons.share,
                  ),
                  ProfileListWidget(
                    title: 'About us',
                    iconData: Icons.question_answer,
                  ),
                  Row(
                    children: [
                      Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toogleTheme();
                            });
                          }),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Change mode',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ProfileListWidget extends StatelessWidget {
  ProfileListWidget({super.key, required this.title, required this.iconData});

  String title;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 25,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
