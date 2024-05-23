import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String text;
  const AppErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
