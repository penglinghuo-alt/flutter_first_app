import 'package:hm_shop/contants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerList() async {
  //返回请求
  return (await DioRequest().get(HttpConstants.BANNER_LIST) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

//获取分类列表
Future<List<CategoryItem>> getCategoryList() async {
  return (await DioRequest().get(HttpConstants.CATEGORY_LIST) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

//特惠推荐
Future<TeHuiTuiJianResult> getTeHuiTuiJianList() async {
  final response = await DioRequest().get(HttpConstants.PRODUCT_LIST);
  if (response is Map<String, dynamic>) {
    return TeHuiTuiJianResult.fromJson(response);
  }
  throw StateError('Invalid TeHuiTuiJianList response format');
}

// 热榜推荐
Future<TeHuiTuiJianResult> getInVogueListAPI() async {
  final response = await DioRequest().get(HttpConstants.IN_VOGUE_LIST);
  return TeHuiTuiJianResult.fromJson(response as Map<String, dynamic>);
}

// 一站式推荐
Future<TeHuiTuiJianResult> getOneStopListAPI() async {
  final response = await DioRequest().get(HttpConstants.ONE_STOP_LIST);
  return TeHuiTuiJianResult.fromJson(response as Map<String, dynamic>);
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  final response = await dioRequest.get(
    HttpConstants.RECOMMEND_LIST,
    params: params,
  );

  if (response is List) {
    return response
        .map((item) => GoodDetailItem.formJSON(item as Map<String, dynamic>))
        .toList();
  }

  if (response is Map<String, dynamic>) {
    if (response['result'] is List) {
      return (response['result'] as List)
          .map((item) => GoodDetailItem.formJSON(item as Map<String, dynamic>))
          .toList();
    }
    if (response['list'] is List) {
      return (response['list'] as List)
          .map((item) => GoodDetailItem.formJSON(item as Map<String, dynamic>))
          .toList();
    }
  }

  throw StateError('Invalid recommend list format');
}
