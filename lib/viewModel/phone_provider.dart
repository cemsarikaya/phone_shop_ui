import 'package:flutter/material.dart';
import 'package:phone_shop_app/model/phone_model.dart';
import 'package:phone_shop_app/service/phone_service.dart';

class PhoneProvider extends ChangeNotifier {
  final IPhoneService phoneService;

  List<PhoneModel> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  PhoneProvider(this.phoneService) {
    fetch();
  }

  Future<void> fetch() async {
    _changeLoading();
    resources = (await phoneService.fetchResourceItem()) ?? [];
    _changeLoading();
  }
}
