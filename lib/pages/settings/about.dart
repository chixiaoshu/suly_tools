import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _iconTapCount = 0;
  bool _showXTile = false;

  void _handleIconTap() {
    setState(() {
      _iconTapCount++;
      if (_iconTapCount >= 7) {
        _showXTile = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: _handleIconTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
              child: Center(
                child: Icon(
                  Icons.info_outline,
                  size: 72,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('关于梨箱'),
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
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
          if (_showXTile)
            ListTile(
              title: Text('X'),
              trailing: Icon(Icons.open_in_new),
              onTap: () {
                launchUrl(
                  Uri.parse('https://x.com/Suly_twelve'),
                  mode: LaunchMode.externalApplication,
                );
              },
            ),
        ],
      ),
    );
  }
}