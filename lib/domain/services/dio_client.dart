import 'package:dio/dio.dart';
import 'package:ong_pet_desafio/domain/services/my_http_client.dart';

class DioClient implements IHttpClient {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }

}