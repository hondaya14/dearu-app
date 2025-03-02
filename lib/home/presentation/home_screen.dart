import 'package:flutter/material.dart';

import '../../common/custom_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final whisper = [
    'あの人に手紙書いてみる？',
    '君の字、綺麗だね',
    '書いた文字は、より心が伝わるよ。',
    '普段言えない ありがとう。を伝えよう',
  ];
  int whisperIndex = 0;

  @override
  void initState() {
    super.initState();
    whisperIndex = 0;
  }

  void changeWhisper() {
    setState(() {
      whisperIndex = (whisperIndex + 1) % (whisper.length - 1);
    });
  }

  @override
  Widget build(final BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              changeWhisper();
            },
            child: Column(
              children: [
                Icon(
                  Icons.man_outlined,
                  size: size.width / 3,
                  color: CustomColor.bgBAB,
                ),
                Text(whisper[whisperIndex]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
