import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String url;

  const CustomBookImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                url,
              ),
            )),
      ),
    );
  }
}
