import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmMoreList extends StatefulWidget {
  // 推荐列表
  final List<GoodDetailItem> recommendList;

  HmMoreList({Key? key, required this.recommendList}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  Widget _buildImage(String picture) {
    if (picture.startsWith('http')) {
      return Image.network(
        picture,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'lib/assets/home_cmd_inner.png',
            fit: BoxFit.cover,
          );
        },
      );
    }
    return Image.asset(picture, fit: BoxFit.cover);
  }
}
    return Image.asset(picture, fit: BoxFit.cover);
  }

  Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: _buildImage(widget.recommendList[index].picture),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.recommendList[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "¥${widget.recommendList[index].price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "${widget.recommendList[index].price}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount}人付款",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisSpacing = 10.0 * 2;
    final itemWidth = (screenWidth - crossAxisSpacing) / 2;
    final itemHeight = itemWidth / 0.78;

    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                aspectRatio: 1.0,
                child: _buildImage(widget.recommendList[index].picture),
              ),
              SizedBox(height: 6),
              Text(
                widget.recommendList[index].name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "¥${widget.recommendList[index].price}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                        children: [
                          TextSpan(text: " "),
                          TextSpan(
                            text: "${widget.recommendList[index].price}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${widget.recommendList[index].payCount}人付款",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
