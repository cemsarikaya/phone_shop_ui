import 'package:flutter/material.dart';
import 'package:phone_shop_app/product/constant/project_dio.dart';
import 'package:phone_shop_app/product/constant/project_items.dart';
import 'package:phone_shop_app/product/widget/phone_slider.dart';
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
              appBar: AppBar(
                title: const Text(ProjectItems.projectName),
              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      const PageUpContainer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: context.watch<PhoneProvider>().resources.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 5,
                                shape:
                                    const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.network(
                                            context.watch<PhoneProvider>().resources[index].imageBlue.toString()),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Text('${context.watch<PhoneProvider>().resources[index].prI}'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}

class PageUpContainer extends StatelessWidget {
  const PageUpContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size contanierSize = MediaQuery.of(context).size;
    return Container(
      height: contanierSize.height * 0.35,
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)), color: Colors.black),
      child: const PhoneSlider(),
    );
  }
}
