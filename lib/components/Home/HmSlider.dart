import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  const HmSlider({super.key, required this.bannerList});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

//轮播图是通过网络请求从后台加载过来的，所以需要有一个类型来承接轮播图的数据
//声明一个轮播图数据对象类型

class _HmSliderState extends State<HmSlider> {
  int _currentIndex = 0;
  //配置控制器
  CarouselSliderController _Controller = CarouselSliderController();

  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _Controller,
      items: widget.bannerList.map((banner) {
        return Image.network(
          banner.imageUrl!,
          fit: BoxFit.cover,
          width: double.infinity,
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        height: 300,
        enlargeCenterPage: false,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      height: 50,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '搜索',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),

      top: 10,
      left: 0,
      right: 0,
    );
  }

  _getDots() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.bannerList.length, (index) {
          return GestureDetector(
            onTap: () {
              _Controller.jumpToPage(index);
            }, //GestureDetector可以实现点击事件，点击后跳转到指定的页面，
            //需要绑定CarouselSliderController的jumpToPage方法，实现跳转

            //AnimatedContainer可以实现动画效果
            child: AnimatedContainer(
              width: index == _currentIndex ? 40 : 10,
              height: 6,
              margin: EdgeInsets.symmetric(horizontal: 5), //horizontal水平方向
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? Colors.white
                    : Color.fromRGBO(0, 0, 0, 0.4),
                borderRadius: BorderRadius.circular(5),
              ),
              duration: Duration(milliseconds: 300), //动画时间
              curve: Curves.easeInOut, //动画曲线
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [_getSlider(), _getSearch(), _getDots()],
    );

    // return Container(
    //   height: 300,
    //   color: Colors.blue,
    //   alignment: Alignment.center,
    //   child: Text(
    //     '${widget.bannerList.length}',
    //     style: TextStyle(color: Colors.white, fontSize: 24),
    //   ),
    // );
  }
}
