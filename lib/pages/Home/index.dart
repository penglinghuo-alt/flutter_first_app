import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  List<GoodsItem> _goodsList = [];

  //从常量到变量

  // BannerItem(
  //   id: '1',
  //   imageUrl:
  //       "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png",
  // ),
  // BannerItem(
  //   id: '2',
  //   imageUrl:
  //       "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nvshen_sj.png",
  // ),
  // BannerItem(
  //   id: '3',
  //   imageUrl:
  //       "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/xinnian_sj.png",
  // ),
  // 特惠推荐
  TeHuiTuiJianResult? _teHuiTuiJianResult = TeHuiTuiJianResult(
    id: "",
    title: "",
    subTypes: [],
  );

  // 热榜推荐
  TeHuiTuiJianResult? _inVogueResult = TeHuiTuiJianResult(
    id: "",
    title: "",
    subTypes: [],
  );

  // 一站式推荐
  TeHuiTuiJianResult? _oneStopResult = TeHuiTuiJianResult(
    id: "",
    title: "",
    subTypes: [],
  );

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController _scrollController = ScrollController();
  double _topPadding = 0.0;

  // 推荐列表
  List<GoodDetailItem> _recommendList = [];
  int _recommendPage = 0;
  final int _recommendPageSize = 10;
  bool _isLoadingRecommend = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.microtask(() async {
        if (!mounted) return;
        setState(() {
          _topPadding = 80;
        });
        _refreshIndicatorKey.currentState?.show();
        try {
          await _refreshAllData();
        } catch (e) {
          if (mounted) {
            ToastUtils.showToast(context, '首页加载失败：$e');
          }
        }
        await Future.delayed(const Duration(milliseconds: 250));
        if (!mounted) return;
        setState(() {
          _topPadding = 0;
        });
      });
    });
  }

  Future<void> _getBannerList() async {
    _bannerList = await getBannerList();
    setState(() {});
  }

  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryList();
    setState(() {});
  }

  // 特惠推荐
  Future<void> _getTeHuiTuiJianList() async {
    _teHuiTuiJianResult = await getTeHuiTuiJianList();
    setState(() {});
  }

  // 获取热榜推荐列表
  Future<void> _getInVogueList() async {
    _inVogueResult = await getInVogueListAPI();
    setState(() {});
  }

  // 获取一站式推荐列表
  Future<void> _getOneStopList() async {
    _oneStopResult = await getOneStopListAPI();
    setState(() {});
  }

  // 获取推荐列表
  Future<void> _loadRecommendPage({int? page}) async {
    if (_isLoadingRecommend) return;
    _isLoadingRecommend = true;
    final nextPage = page ?? _recommendPage + 1;
    try {
      final list = await getRecommendListAPI({
        "limit": _recommendPageSize,
        "page": nextPage,
      });

      if (page == 1) {
        _recommendPage = 1;
        _recommendList = list.isEmpty ? _buildFallbackRecommendItems() : list;
      } else if (list.isEmpty) {
        final firstPage = await getRecommendListAPI({
          "limit": _recommendPageSize,
          "page": 1,
        });
        _recommendPage = 1;
        if (firstPage.isEmpty) {
          _recommendList = _buildFallbackRecommendItems();
        } else {
          _recommendList = List.of(_recommendList)..addAll(firstPage);
        }
      } else {
        _recommendPage = nextPage;
        _recommendList = List.of(_recommendList)..addAll(list);
      }
    } catch (e) {
      if (mounted && _recommendList.isEmpty) {
        ToastUtils.showToast(context, '推荐列表加载失败：$e');
      }
    } finally {
      _isLoadingRecommend = false;
      if (mounted) setState(() {});
    }
  }

  List<GoodDetailItem> _buildFallbackRecommendItems() {
    final images = [
      'lib/assets/home_cmd_sm.png',
      'lib/assets/home_cmd_inner.png',
      'lib/assets/goods_avatar.png',
    ];
    return List.generate(6, (index) {
      return GoodDetailItem(
        id: 'fallback_${index + 1}',
        name: '猜你喜欢${index + 1}',
        picture: images[index % images.length],
        price: '99.00',
        orderNum: 0,
        payCount: 50 + index * 20,
      );
    });
  }

  Widget _buildStickyHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 68, 34, 20),
        ),
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 160 &&
        !_isLoadingRecommend) {
      _loadRecommendPage();
    }
  }

  Future<void> _refreshAllData() async {
    await _getBannerList();
    await _getCategoryList();
    await _getTeHuiTuiJianList();
    await _getInVogueList();
    await _getOneStopList();
    await _loadRecommendPage(page: 1);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        setState(() {
          _topPadding = 80;
        });
        await _refreshAllData();
        await Future.microtask(() {
          if (mounted) {
            setState(() {
              _topPadding = 0;
            });
          }
        });
        if (_scrollController.hasClients) {
          await _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
        ToastUtils.showToast(
          context,
          "刷新完成",
          duration: const Duration(seconds: 1),
        );
      },
      displacement: 80,
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverToBoxAdapter(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              height: _topPadding,
            ),
          ),
          SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: HmSuggestion(teHuiTuiJianResult: _teHuiTuiJianResult),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Flex(
                children: [
                  Expanded(
                    child: HmHot(result: _inVogueResult!, type: 'hot'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: HmHot(result: _oneStopResult!, type: 'step'),
                  ),
                ],
                direction: Axis.horizontal,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyHeaderDelegate(title: '猜你喜欢'),
          ),
          HmMoreList(recommendList: _recommendList), // 无限滚动列表
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: _isLoadingRecommend
                    ? const CircularProgressIndicator()
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  _StickyHeaderDelegate({required this.title});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 68, 34, 20),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant _StickyHeaderDelegate oldDelegate) {
    return oldDelegate.title != title;
  }
}
