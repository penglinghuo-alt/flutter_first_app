import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> _getChildren() => [
    HomeView(),
    CategoryView(),
    CartView(),
    MineView(),
  ];

  @override
  Widget build(BuildContext context) {
    //定义数据 根据数据进行渲染4个导航
    //一般应用程序的导航是固定的

    final List<Map<String, String>> _tabList = [
      {
        "icon": "lib/assets/ic_public_home_normal.png", //正常显示的图标
        "active_icon": "lib/assets/ic_public_home_active.png", //激活显示的图标
        "text": "首页",
      },
      {
        "icon": "lib/assets/ic_public_pro_normal.png",
        "active_icon": "lib/assets/ic_public_pro_active.png",
        "text": "分类",
      },
      {
        "icon": "lib/assets/ic_public_cart_normal.png",
        "active_icon": "lib/assets/ic_public_cart_active.png",
        "text": "购物车",
      },
      {
        "icon": "lib/assets/ic_public_my_normal.png",
        "active_icon": "lib/assets/ic_public_my_active.png",
        "text": "我的",
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ), //SafeArea
      // 用于避免内容被状态栏遮挡
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true, //是否显示未选中时的标签
        unselectedItemColor: Colors.grey, //未选中时的颜色
        selectedItemColor: Colors.black, //选中时的颜色
        //绑定点击事件
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex, //当前选中第几个导航
        items: _getTabBarWidget(_tabList),
      ),
    );
  }

  //返回底部渲染的4个分类
  List<BottomNavigationBarItem> _getTabBarWidget(
    List<Map<String, String>> tabList,
  ) {
    // return tabList.map((item) {
    //   return BottomNavigationBarItem(
    //     icon: Image.asset(item['icon']!, width: 24, height: 24),
    //     activeIcon: Image.asset(item['active_icon']!, width: 24, height: 24),
    //     label: item['text'],
    //   );
    // }).toList();

    return List.generate(tabList.length, (index) {
      final item = tabList[index];
      return BottomNavigationBarItem(
        icon: Image.asset(item['icon']!, width: 30, height: 30), //正常显示图标
        activeIcon: Image.asset(
          item['active_icon']!,
          width: 30,
          height: 30,
        ), //激活图标
        label: item['text'], //
      );
    });
  }
}
