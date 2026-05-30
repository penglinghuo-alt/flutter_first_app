import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmHot extends StatefulWidget {
  // 热榜推荐
  final TeHuiTuiJianResult result;
  // 类型
  final String type;
  // 一站式推荐
  HmHot({Key? key, required this.result, required this.type}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  // 获取前两条数据
  List<TeHuiGoodsItem> get _items {
    if (widget.result.subTypes.isEmpty) {
      return [];
    }
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  List<Widget> _getChildrenList() {
    if (_items.isEmpty) {
      return [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              widget.type == "step" ? "暂无数据" : "暂无商品",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ),
      ];
    }

    return _items.map((item) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 0.75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.picture,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "lib/assets/home_cmd_inner.png",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),
              Flexible(
                child: Text(
                  "¥${item.price}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color.fromARGB(255, 86, 24, 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          widget.type == "step" ? "一站买全" : "爆款推荐",
          style: TextStyle(
            color: const Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == "step" ? "精心优选" : "最受欢迎",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.type == "step"
              ? const Color.fromARGB(255, 249, 247, 219)
              : const Color.fromARGB(255, 211, 228, 240),
        ),
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 10),
            Row(
              children: _getChildrenList(),
            ),
          ],
        ),
      ),
    );
  }
}
