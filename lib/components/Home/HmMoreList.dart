import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  const HmMoreList({super.key});

  @override
  State<HmMoreList> createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return //可以自动分两边占满且可以竖直滚动
    SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),

      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text('更多商品$index'),
          color: Colors.blueAccent,
          alignment: Alignment.center,
        );
      },
    );
  }
}
