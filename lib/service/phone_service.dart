import 'dart:io';

import 'package:dio/dio.dart';
import 'package:phone_shop_app/model/phone_model.dart';

abstract class IPhoneService {
  IPhoneService(this.dio);
  final Dio dio;

  Future<List<PhoneModel>?> fetchResourceItem();
}

class PhoneService extends IPhoneService {
  PhoneService(Dio dio) : super(dio);

  @override
  Future<List<PhoneModel>?> fetchResourceItem() async {
    final response = await dio.get('/phones.json');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((e) => PhoneModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
