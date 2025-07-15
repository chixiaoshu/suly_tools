import 'package:flutter/material.dart';
import 'package:suly_tools/pages/tools/hex_converter.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '常用工具',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(title: const Text('test1'), onTap: () {}),
        ListTile(title: const Text('test2'), onTap: () {}),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '开发工具',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: const Text('进制转换'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HexConverterPage()),
            );
          },
        ),
      ],
    );
  }
}
