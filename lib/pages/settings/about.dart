import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('关于梨箱'),
          ),
          ListTile(
            title: Text('Github'),
            trailing: Icon(Icons.open_in_new),
            onTap: () {
              launchUrl(
                Uri.parse('https://github.com/chixiaoshu/suly_tools'),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
        ],
      ),
    );
  }
}