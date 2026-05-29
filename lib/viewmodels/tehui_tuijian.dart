class TeHuiTuiJianResponse {
  final String code;
  final String msg;
  final TeHuiTuiJianResult? result;

  TeHuiTuiJianResponse({required this.code, required this.msg, this.result});

  factory TeHuiTuiJianResponse.fromJson(Map<String, dynamic> json) {
    return TeHuiTuiJianResponse(
      code: json['code']?.toString() ?? '',
      msg: json['msg']?.toString() ?? '',
      result: json['result'] != null
          ? TeHuiTuiJianResult.fromJson(json['result'] as Map<String, dynamic>)
          : null,
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
