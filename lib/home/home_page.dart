import 'package:flutter/material.dart';

import '../common/custom_color.dart';

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text('dumm\n\n\n\n\n\n n')),
                Center(child: Text('dumm\n\n\n\n\n\n n')),
                Center(child: Text('dumm\n\n\n\n\n\n n')),
                Center(child: Text('dumm\n\n\n\n\n\n n')),
                Center(child: Text('dumm\n\n\n\n\n\n n')),
                Center(child: Text('dumm\n\n\n\n\n\n n')),
              ],
            ),
          ),
          BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColor.bgBNB,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 0,
            // items count is must be odd because of fab.
            items:  [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: CustomColor.icon), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book, color: CustomColor.icon), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit, color: CustomColor.icon), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group, color: CustomColor.icon), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: CustomColor.icon), label: ''),
            ],
          ),]
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColor.bgBNB,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        // items count is must be odd because of fab.
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: CustomColor.icon), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: CustomColor.icon), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.edit, color: CustomColor.icon), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.group, color: CustomColor.icon), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: CustomColor.icon), label: ''),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: CustomColor.fab,
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
