import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {    
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('账号信息',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text('用户名'),
          leading: Icon(Icons.perm_identity),
          trailing: Text('default'),
        ),
      ],
    );
  }
}