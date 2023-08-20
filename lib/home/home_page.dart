import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: const Color(0x99DDDDDD),
        title: Text('ここはいらない'),
      ),
      body: Center(
        child: Text('dummy'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0x99CCCCCC),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        // items count is must be odd because of fab.
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color(0xFFFFFFFF)), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Color(0xFFFFFFFF)), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit, color: Color(0xFFFFFFFF)), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.group, color: Color(0xFFFFFFFF)), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Color(0xFFFFFFFF)), label: ''),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0x77999999),
        onPressed: () {
          print('press fab');
        },
        child: const Icon(
          Icons.edit,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
