import 'package:flutter/material.dart';

import '../../common/custom_color.dart';
import 'components/bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      bottomNavigationBar: bottomAppBar(),
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
}
