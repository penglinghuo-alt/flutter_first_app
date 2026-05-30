import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  HmCategory({super.key, required this.categoryList});

  @override
  State<HmCategory> createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 5,
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.picture, width: 40, height: 40),
                SizedBox(height: 4),
                Flexible(
                  child: Container(
                    width: 50,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
