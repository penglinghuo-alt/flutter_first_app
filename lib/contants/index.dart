//全局的常量
class GlobalConstants {
  static const String baseUrl = 'https://meikou-api.itheima.net'; //基础地址
  static const int TIME_OUT = 10; //超时时间
  static const String SUCESS_CODE = '1'; //成功状态码
}

//静态属性：在类中定义的属性，不需要实例化对象就可以使用

//存放请求地址接口的常量
class HttpConstants {
  static const String BANNER_LIST = '/home/banner'; //banner列表接口
  static const String CATEGORY_LIST = '/home/category/head'; //分类列表接口
  static const String PRODUCT_LIST = '/hot/preference'; //特惠推荐地址
  static const String IN_VOGUE_LIST = "/hot/inVogue"; // 热榜推荐地址
  static const String ONE_STOP_LIST = "/hot/oneStop"; // 一站式推荐地址
  static const String RECOMMEND_LIST = "/home/recommend"; // 推荐列表
}
