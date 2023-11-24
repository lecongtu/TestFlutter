import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/screen/calendar.dart';
import 'package:to_do_list/screen/home.dart';
import 'package:to_do_list/screen/notification.dart';
import 'package:to_do_list/screen/profile.dart';
import 'package:to_do_list/theme/theme.dart';
import 'package:to_do_list/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentTab = 0;
  final List<Widget> screens = [Home(), Calendar(), Notify(), Profile()];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

  void handleChangeTab(int tabNumber) {
    setState(() {
      currentScreen = screens[tabNumber];
      currentTab = tabNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(child: currentScreen, bucket: bucket),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 60,
        notchMargin: 10,
        child: SizedBox(
          child: (Wrap(
            alignment: WrapAlignment.spaceAround, // set your alignment
            children: <Widget>[
              TabItemWidget(
                currentTab: currentTab,
                iconData: Icons.home,
                tabNumber: 0,
                onClickTab: handleChangeTab,
              ),
              TabItemWidget(
                currentTab: currentTab,
                iconData: Icons.calendar_month,
                tabNumber: 1,
                onClickTab: handleChangeTab,
              ),
              TabItemWidget(
                currentTab: currentTab,
                iconData: Icons.notifications,
                tabNumber: 2,
                onClickTab: handleChangeTab,
              ),
              TabItemWidget(
                currentTab: currentTab,
                iconData: Icons.person,
                tabNumber: 3,
                onClickTab: handleChangeTab,
              )
            ],
          )),
        ),
      ),
    );
  }
}

class TabItemWidget extends StatelessWidget {
  const TabItemWidget(
      {super.key,
      required this.currentTab,
      required this.iconData,
      required this.tabNumber,
      required this.onClickTab});

  final int currentTab;
  final IconData iconData;
  final int tabNumber;
  final Function onClickTab;

  void handleOnClick() {
    onClickTab(tabNumber);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      onPressed: handleOnClick,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 30,
            color: tabNumber == currentTab ? Colors.blue : Colors.grey,
          )
        ],
      ),
    );
  }
}
