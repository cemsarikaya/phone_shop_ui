import 'package:flutter/material.dart';
import 'package:phone_shop_app/product/constant/project_dio.dart';
import 'package:phone_shop_app/service/phone_service.dart';
import 'package:phone_shop_app/viewModel/phone_provider.dart';
import 'package:provider/provider.dart';

class PhoneScreenView extends StatefulWidget {
  const PhoneScreenView({Key? key}) : super(key: key);
  @override
  State<PhoneScreenView> createState() => _PhoneScreenViewState();
}

class _PhoneScreenViewState extends State<PhoneScreenView> with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PhoneProvider(PhoneService(service)),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
              itemCount: context.watch<PhoneProvider>().resources.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(context.watch<PhoneProvider>().resources[index].name.toString());
              },
            ),
          );
        });
  }
}
