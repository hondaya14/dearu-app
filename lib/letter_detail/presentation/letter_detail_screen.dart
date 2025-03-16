import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../base/domain/model/entity/letter.dart';

class LetterDetailScreen extends StatelessWidget {
  final Letter letter;

  const LetterDetailScreen({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(letter.senderUserId.value),
      ),
      body: InteractiveViewer(
        minScale: 0.5,
        maxScale: 5.0,
        panEnabled: true,
        child: FutureBuilder(
          future: _getSvgData(),
          builder: (context, snapshot) {
            // Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black54),
              );
            }

            // Not Found
            // TODO: デザイン
            if (snapshot.hasData) {
              final response = snapshot.data as HttpClientResponse;
              if (response.statusCode == HttpStatus.notFound) {
                return const Center(child: Text('Not Found'));
              }
            }
            // OK: SVG画像を表示
            return SvgPicture.network(
              "https://pub-8545ef1bf4bc46a7b15bc2e91cbea974.r2.dev/${letter.letterId}.svg",
              // not foundの時、エラー画面を表示する
            );
          },
        ),
      ),
    );
  }

  Future<HttpClientResponse> _getSvgData() async {
    await Future.delayed(const Duration(seconds: 1));
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(
        "https://pub-8545ef1bf4bc46a7b15bc2e91cbea974.r2.dev/${letter.letterId}.svg"));
    final response = await request.close();
    return response;
  }
}
