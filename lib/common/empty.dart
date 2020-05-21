import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "\n아무것도없음!!",
      style: TextStyle(height: 0),
    );
  }
}
