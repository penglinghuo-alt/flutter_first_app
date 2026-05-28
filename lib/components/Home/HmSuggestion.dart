import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  const HmSuggestion({super.key});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: Center(
        child: Text("猜你喜欢", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
