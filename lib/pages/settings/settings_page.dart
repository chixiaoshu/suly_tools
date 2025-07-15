import 'package:flutter/material.dart';
import 'package:suly_tools/pages/settings/about.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('APP'),
            leading: const Icon(Icons.apps),
            onTap: () {},
          ),

          ListTile(
            title: const Text('关于'),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0), // 从右侧滑入
                        end: Offset.zero,
                      ).animate(animation),
                      child: const AboutPage(),
                    );
                  },
                ),
              );
            },
          ),
          // 其他设置项...
        ],
      ),
    );
  }
}
