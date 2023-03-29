import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    String baseUrl = 'https://api.openai.com/v1/chat/';

    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
      ),
    );
  }

  static Future<Response> postData(
      {required String url, required Map<String, dynamic> data}) async {
    String API_KEY = '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';
    dio!.options.headers = {
      'Authorization': "Bearer ${API_KEY}",
      'Content-Type': 'application/json',
    };
    return dio!.post(url, data: data);
  }
}
