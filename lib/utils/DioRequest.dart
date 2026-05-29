//基于Dio进行二次封装

import 'package:dio/dio.dart';
import 'package:hm_shop/contants/index.dart';

class DioRequest {
  final _dio = Dio(); //dio请求对象

  //基础地址拦截器
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    //拦截器
    _addInterceptors();
  }

  //添加拦截器
  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          return handler.next(request);
        },
        onResponse: (response, handler) {
          //处理http状态
          //http状态码 200 300
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            //非空判断
            return handler.next(response);
            //或者写成
            //handler.next(response);
            //return;
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          return handler.reject(error);
        },
      ),
    );
  }

  //封装get方法，处理业务状态码，进一步进行解构
  get(String url, {Map<String, dynamic>? params}) async {
    return await _handleBusinessStatus(
      await _dio.get(url, queryParameters: params),
    );
  }

  //进一步处理返回解构的函数
}

//处理业务状态码
Future<dynamic> _handleBusinessStatus(Response<dynamic> task) async {
  try {
    Response<dynamic> res = task;
    final code = res.data['code'];
    final success =
        code == GlobalConstants.SUCESS_CODE || code == 1 || code == '1';
    if (success) {
      return res.data['result'];
    } else {
      throw Exception(res.data['msg'] ?? "加载数据异常");
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

//单例对象

final dioRequest = DioRequest();


//dio 请求工具发出请求，返回的数据 Response<dynamic>.data
//把所有的接口的data解放出来，拿到真正的数据，要判断业务状态吗是不是等于1