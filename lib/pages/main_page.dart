 import 'package:flutter/material.dart';
 import 'package:suly_tools/pages/settings/settings_page.dart';
 import 'package:suly_tools/pages/home_page.dart';
 import 'package:suly_tools/pages/categories_page.dart';
 import 'package:suly_tools/pages/person_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  String _currentTitle = '首页';
  
  final List<Widget> _pages = const [
    HomePage(key: ValueKey('home')),
    CategoriesPage(key: ValueKey('categories')),
    PersonPage(key: ValueKey('person')),
  ];

  final List<String> _titles = ['首页', '分类', '我的'];

  @override
  void initState() {
    super.initState();
    _currentTitle = _titles[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currentTitle = _titles[index];
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}