import 'package:flutter/material.dart';

class HexConverterPage extends StatefulWidget {
  const HexConverterPage({super.key});

  @override
  State<HexConverterPage> createState() => _HexConverterPageState();
}

class _HexConverterPageState extends State<HexConverterPage> {
  final _binController = TextEditingController();
  final _octController = TextEditingController();
  final _decController = TextEditingController();
  final _hexController = TextEditingController();

  bool _updating = false;

  void _onChanged(String value, int base) {
    if (_updating) return;
    _updating = true;
    int? number;
    try {
      if (value.isEmpty) {
        _binController.text = '';
        _octController.text = '';
        _decController.text = '';
        _hexController.text = '';
        _updating = false;
        return;
      }
      number = int.parse(value, radix: base);
    } catch (_) {
      _updating = false;
      return;
    }
    if (base != 2) _binController.text = number.toRadixString(2);
    if (base != 8) _octController.text = number.toRadixString(8);
    if (base != 10) _decController.text = number.toString();
    if (base != 16) _hexController.text = number.toRadixString(16).toUpperCase();
    _updating = false;
  }

  @override
  void dispose() {
    _binController.dispose();
    _octController.dispose();
    _decController.dispose();
    _hexController.dispose();
    super.dispose();
  }

  Widget _buildRow(String label, TextEditingController controller, int base, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          SizedBox(width: 60, child: Text(label)),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
              onChanged: (v) => _onChanged(v, base),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('进制转换器'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          _buildRow('二进制(BIN)', _binController, 2, '如: 1010'),
          _buildRow('八进制(OCT)', _octController, 8, '如: 12'),
          _buildRow('十进制(DEC)', _decController, 10, '如: 10'),
          _buildRow('十六进制(HEX)', _hexController, 16, '如: A'),
        ],
      ),
    );
  }
}