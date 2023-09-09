import 'package:flutter/material.dart';

import '../../common/router.dart';

class LetterEditScreen extends StatelessWidget {
  const LetterEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            router.go(AppPath.base);
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Letter Edit Screen"),
        ),
      ),
    );
  }
}
