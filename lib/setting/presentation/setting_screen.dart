import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/logger.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: [
          ListTile(
            // RevenueCat?
            // Buymeacoffee?
            // Stripe?
            leading: const Icon(Icons.coffee_rounded),
            title: const Text('Buy me a coffee'),
            subtitle: const Text('開発者へコーヒーを買う'),
            onTap: () {
              logger.i('tapped share button');
            },
          ),
          header('一般'),
          ListTile(
            leading: const Icon(Icons.share_rounded),
            title: const Text('シェア'),
            subtitle: const Text('誰かに教えなきゃもったいない'),
            onTap: () {
              logger.i('tapped share button');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_border),
            title: const Text('評価'),
            subtitle: const Text('罵声から称賛まで'),
            onTap: () {
              logger.i('tapped review button');
            },
          ),
          ListTile(
            leading: const Icon(Icons.mail_outline),
            title: const Text('ご意見'),
            subtitle: const Text('クレームから愛の告白まで'),
            onTap: () async {
              // NOTE: iOS Simulator cannot launch mailto scheme
              final Uri url = Uri.parse('mailto:nqvno14@gmail.com');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                logger.e('Unable launch url: $url');
                throw 'Unable to launch url $url';
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.snowboarding_outlined),
            title: const Text('開発者'),
            subtitle: const Text('ここはどこ？私は誰？'),
            onTap: () async {
              final Uri url = Uri.parse('https://nqvno.net');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                logger.e('Unable launch url: $url');
                throw 'Unable to launch url $url';
              }
            },
          ),
          header('設定'),
          ListTile(
            leading: const Icon(Icons.notifications_none_rounded),
            title: const Text('通知設定'),
            subtitle: const Text('あの人からの想いに音を乗せて'),
            onTap: () {
              logger.i('tapped notification button');
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_rounded),
            title: const Text('言語設定'),
            subtitle: const Text('国境を超えていけ'),
            onTap: () {
              logger.i('tapped language button');
            },
          ),
        ],
      ),
    );
  }

  Widget header(final String name) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: Text(name),
    );
  }
}
