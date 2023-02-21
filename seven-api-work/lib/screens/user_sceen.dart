import 'package:flutter/material.dart';

import '../pages/notes_page.dart';
import '../pages/profile_page.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  final List<Widget> pages = [const HistoryPage(), const ProfilePage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Записи'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль')
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() => currentIndex = value);
        },
      ),
    );
  }
}
