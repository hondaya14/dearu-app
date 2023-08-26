import 'package:flutter/material.dart';

import '../common/custom_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text('dummy\n\n\n\n\n\ndummy\n\n\n\n\n\n ndummy\n\n\n\n\n\n ndummy')),
            Center(child: Text('dummy\n\n\n\n\n\ndummy\n\n\n\n\n\n ndummy\n\n\n\n\n\n ndummy')),
            Center(child: Text('dummy\n\n\n\n\n\ndummy\n\n\n\n\n\n ndummy\n\n\n\n\n\n ndummy')),
          ],
        ),
      ),

      // bottomNavigationBar or bottomAppBar
      bottomNavigationBar: _bottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: CustomColor.fab,
        onPressed: () {
          print('press fab');
        },
        child: const Icon(Icons.edit, color: Color(0xFFFFFFFF), size: 30),
      ),
    );
  }

  // BottomNavigationBar bottomNavigationBar() {
  //   return BottomNavigationBar(
  //     elevation: 0,
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: CustomColor.bgBNB,
  //     showSelectedLabels: false,
  //     showUnselectedLabels: false,
  //     currentIndex: 0,
  //     // items count is must be odd because of fab.
  //     items: [
  //       BottomNavigationBarItem(icon: Icon(Icons.home, color: CustomColor.icon), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.book, color: CustomColor.icon), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.edit, color: CustomColor.icon), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.group, color: CustomColor.icon), label: ''),
  //       BottomNavigationBarItem(icon: Icon(Icons.settings, color: CustomColor.icon), label: ''),
  //     ],
  //   );
  // }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      color: CustomColor.fab,
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bABIconButton(Icons.home, null, true),
          _bABIconButton(Icons.book, null, false),
          dummyIconButton(),
          _bABIconButton(Icons.group, null, false),
          _bABIconButton(Icons.settings, null, false),
        ],
      ),
    );
  }

  // BottomAppBarIconButton
  Container _bABIconButton(IconData iconData, VoidCallback? onPressed, bool isSelected) {
    return Container(
      decoration: isSelected
          ? const BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xFFFFFFFF), Color(0x99AAAAAA)],
              ),
              shape: BoxShape.circle,
            )
          : null,
      child: IconButton(
        icon: Icon(iconData, color: CustomColor.icon, size: 30),
        onPressed: onPressed,
      ),
    );
  }

  // dummyIconButton for Floating action button on bottomAppBar
  IconButton dummyIconButton() {
    return const IconButton(
        icon: Icon(Icons.circle, color: Colors.transparent, size: 0), onPressed: null);
  }
}
