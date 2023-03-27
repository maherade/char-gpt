import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    String baseUrl = 'https://api.openai.com/v1/chat/';
    String API_KEY = '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';

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
    dio!.options.headers = {
      "Authorization":
          'Bearer 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',
      "Content-Type": 'application/json',
    };
    return dio!.post(url, data: data);
  }
}
