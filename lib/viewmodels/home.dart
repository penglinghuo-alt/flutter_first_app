class BannerItem {
  String? id;
  String? imageUrl;

  BannerItem({required this.imageUrl, required this.id});

  //拓展一个工厂函数，一般用factory关键字来声明，一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    //必须返回一个BannerItem对象
    return BannerItem(id: json['id'], imageUrl: json["imgUrl"] ?? '');
  }
}

//<>定义数据类型也可以，但是报错不易察觉
//用class定义数据类型，更加具体，更加灵活方便

//flutter必须强制转化，没有隐式转化
//  {
//             "id": "1181622001",
//             "name": "气质女装",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/qznz.png",
//             "children": [
//                 {
//                     "id": "1191110001",
//                     "name": "半裙",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bq.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110002",
//                     "name": "衬衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_cs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110022",
//                     "name": "T恤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_tx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110023",
//                     "name": "针织衫",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_zzs.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110024",
//                     "name": "夹克",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_jk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110025",
//                     "name": "卫衣",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_wy.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110028",
//                     "name": "背心",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/qznz_bx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622002",
//             "name": "女士内衣",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/nsny.png",
//             "children": [
//                 {
//                     "id": "1191110003",
//                     "name": "文胸",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_wx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110004",
//                     "name": "短袜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_dw.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110005",
//                     "name": "起居服",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110029",
//                     "name": "内裤",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_nk.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110030",
//                     "name": "连裤袜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/nsny_lkw.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110033",
//                     "name": "塑身衣/塑身裤",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110034",
//                     "name": "内衣套装",
//                     "picture": "https://yanxuan.nosdn.127.net/f5797ca77cfe413e7753ec69f9bd4bb1.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622003",
//             "name": "箱包手袋",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/xbsd.png",
//             "children": [
//                 {
//                     "id": "1191110006",
//                     "name": "单肩包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_djb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110007",
//                     "name": "双肩包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_sjb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110008",
//                     "name": "手提包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_stb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110026",
//                     "name": "斜挎包",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/xbsd_xkb.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622004",
//             "name": "时尚饰品",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/sssp.png",
//             "children": [
//                 {
//                     "id": "1191110009",
//                     "name": "耳饰",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_es.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110010",
//                     "name": "项链",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_xl.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110011",
//                     "name": "手链/手镯",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_sz.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110012",
//                     "name": "戒指",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_jz.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110014",
//                     "name": "挂饰及其他",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/sssp_js.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622005",
//             "name": "服饰配件",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/zspj.png",
//             "children": [
//                 {
//                     "id": "1191110015",
//                     "name": "渔夫帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_yfm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110016",
//                     "name": "贝雷帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_blm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110017",
//                     "name": "报童帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_baotongmao.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110018",
//                     "name": "草帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_cm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110036",
//                     "name": "手套",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_st.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110037",
//                     "name": "围巾丝巾",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_wjsj.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110040",
//                     "name": "针织帽",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/fspj_zzm.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622006",
//             "name": "时尚女鞋",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/ssnx.png",
//             "children": [
//                 {
//                     "id": "1191110042",
//                     "name": "休闲鞋",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/ssnx_xxx.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         },
//         {
//             "id": "1181622009",
//             "name": "眼镜配件",
//             "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c1/yypj.png",
//             "children": [
//                 {
//                     "id": "1191110020",
//                     "name": "太阳镜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/yjpj_tyj.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 },
//                 {
//                     "id": "1191110021",
//                     "name": "光学眼镜",
//                     "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/c2/yjpj_gxyj.png?quality=95&imageView",
//                     "children": null,
//                     "goods": null
//                 }
//             ],
//             "goods": null
//         }

//根据json编写class对象和工厂转换函数
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  List<GoodsItem>? goods;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      children: json['children'] != null
          ? List<CategoryItem>.from(
              json['children'].map((x) => CategoryItem.fromJson(x)),
            )
          : null,
      goods: json['goods'] != null
          ? List<GoodsItem>.from(
              json['goods'].map((x) => GoodsItem.fromJson(x)),
            )
          : null,
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String picture;
  double price;
  int stock;
  String createTime;

  GoodsItem({
    required this.id,
    required this.name,
    required this.picture,
    required this.price,
    required this.stock,
    required this.createTime,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      price: json['price'] is double
          ? json['price'] as double
          : double.tryParse(json['price']?.toString() ?? '') ?? 0.0,
      stock: json['stock'] is int
          ? json['stock'] as int
          : int.tryParse(json['stock']?.toString() ?? '0') ?? 0,
      createTime: json['createTime']?.toString() ?? '',
    );
  }
}

class TeHuiTuiJianResult {
  final String id;
  final String title;
  final List<TeHuiSubType> subTypes;

  TeHuiTuiJianResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory TeHuiTuiJianResult.fromJson(Map<String, dynamic> json) {
    return TeHuiTuiJianResult(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subTypes: json['subTypes'] != null
          ? List<TeHuiSubType>.from(
              (json['subTypes'] as List<dynamic>).map(
                (x) => TeHuiSubType.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
}

class TeHuiSubType {
  final String id;
  final String title;
  final TeHuiGoodsItems goodsItems;

  TeHuiSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory TeHuiSubType.fromJson(Map<String, dynamic> json) {
    return TeHuiSubType(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      goodsItems: TeHuiGoodsItems.fromJson(
        json['goodsItems'] as Map<String, dynamic>,
      ),
    );
  }
}

class TeHuiGoodsItems {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<TeHuiGoodsItem> items;

  TeHuiGoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory TeHuiGoodsItems.fromJson(Map<String, dynamic> json) {
    return TeHuiGoodsItems(
      counts: json['counts'] is int
          ? json['counts'] as int
          : int.tryParse(json['counts']?.toString() ?? '0') ?? 0,
      pageSize: json['pageSize'] is int
          ? json['pageSize'] as int
          : int.tryParse(json['pageSize']?.toString() ?? '0') ?? 0,
      pages: json['pages'] is int
          ? json['pages'] as int
          : int.tryParse(json['pages']?.toString() ?? '0') ?? 0,
      page: json['page'] is int
          ? json['page'] as int
          : int.tryParse(json['page']?.toString() ?? '0') ?? 0,
      items: json['items'] != null
          ? List<TeHuiGoodsItem>.from(
              (json['items'] as List<dynamic>).map(
                (x) => TeHuiGoodsItem.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
}

class TeHuiGoodsItem {
  final String id;
  final String name;
  final String? desc;
  final String price;
  final String picture;
  final int orderNum;

  TeHuiGoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory TeHuiGoodsItem.fromJson(Map<String, dynamic> json) {
    return TeHuiGoodsItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      desc: json['desc']?.toString(),
      price: json['price']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      orderNum: json['orderNum'] is int
          ? json['orderNum'] as int
          : int.tryParse(json['orderNum']?.toString() ?? '0') ?? 0,
    );
  }
}

class GoodDetailItem {
  final String id;
  final String name;
  final String picture;
  final String price;
  final int orderNum;
  final int payCount;

  GoodDetailItem({
    required this.id,
    required this.name,
    required this.picture,
    required this.price,
    required this.orderNum,
    required this.payCount,
  });

  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      orderNum: json['orderNum'] is int
          ? json['orderNum'] as int
          : int.tryParse(json['orderNum']?.toString() ?? '0') ?? 0,
      payCount: json['payCount'] is int
          ? json['payCount'] as int
          : int.tryParse(json['payCount']?.toString() ?? '0') ?? 0,
    );
  }
}
