import 'package:dio/dio.dart';
import 'package:mova_app/api/api_client.dart';
import 'package:mova_app/constants/api_constants.dart';
import 'package:mova_app/services/hive_service.dart';

class ApiHelper {
  static ApiClient getClient() {
    String language = HiveService.getLanguage().toLowerCase();

    final dio = Dio(
      BaseOptions(
        contentType: 'application/json;charset=utf-8',
        queryParameters: {
          'api_key': ApiConstants.apiKey,
          'language': language,
        },
      ),
    );

    return ApiClient(dio);
  }
}
