import 'package:dio/dio.dart';

class ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://deneme-befe3-default-rtdb.firebaseio.com'));
}
