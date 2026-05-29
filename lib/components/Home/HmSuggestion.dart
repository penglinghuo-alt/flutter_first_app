import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final TeHuiTuiJianResult? teHuiTuiJianResult;
  const HmSuggestion({super.key, this.teHuiTuiJianResult});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  List<TeHuiGoodsItem> _getDisplayItems() {
    if (widget.teHuiTuiJianResult == null ||
        widget.teHuiTuiJianResult!.subTypes.isEmpty ||
        widget.teHuiTuiJianResult!.subTypes.first.goodsItems.items.isEmpty) {
      return [];
    }

    return widget.teHuiTuiJianResult!.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  Widget buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text("精选省攻略", style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget buildLeft() {
    return SizedBox(
      width: 90,
      height: 140,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    final list = _getDisplayItems();
    if (list.isEmpty) {
      return [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text(
              '暂无特惠数据',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ),
      ];
    }

    return List.generate(list.length, (int index) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  list[index].picture,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'lib/assets/home_cmd_inner.png',
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 96, 12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "￥${list[index].price}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: 200,
        alignment: Alignment.center,
        child: Column(
          children: [
            buildHeader(),
            Row(
              children: [
                buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
