import 'package:flutter/cupertino.dart';

class PostboxScreen extends StatelessWidget {
  const PostboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Center(child: Text('postbox\n\n\n\n\n\ndummy\n\n\n\n\n\n ndummy\n\n\n\n\n\n ndummy')),
          Center(child: Text('postbox\n\n\n\n\n\ndummy\n\n\n\n\n\n ndummy\n\n\n\n\n\n ndummy')),
          Center(child: Text('postbox\n\n\n\n\n\ndummy\n\n\n\n\n\n ndummy\n\n\n\n\n\n ndummy')),
        ],
      ),
    );
  }
}
