import 'package:flutter/material.dart';

class PostboxScreen extends StatelessWidget {
  const PostboxScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    // fetch letter
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text('あなたへ'),
            subtitle: Text('妻より'),
            trailing: Text('2025/01/10'),
          ),
        ],
      ),
    );
  }
}
