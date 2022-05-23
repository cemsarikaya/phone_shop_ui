import 'package:flutter/material.dart';
import 'package:phone_shop_app/model/phone_model.dart';
import 'package:phone_shop_app/product/constant/padding_items.dart';
import 'package:phone_shop_app/product/constant/project_dio.dart';
import 'package:phone_shop_app/product/constant/project_items.dart';
import 'package:phone_shop_app/product/widget/phone_slider.dart';
import 'package:phone_shop_app/service/phone_service.dart';
import 'package:phone_shop_app/view/phone_detail_screen.dart';
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
    double sizedBoxHeight = MediaQuery.of(context).size.height / 1.2;

    return ChangeNotifierProvider(
        create: (context) => PhoneProvider(PhoneService(service)),
        builder: (context, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(ProjectItems.projectName),
                actions: [
                  Padding(
                    padding: PaddindUtility().paddingIcon,
                    child: const PhoneBasketBtn(),
                  ),
                ],
              ),
              body: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      const PageUpContainer(),
                      SizedBox(
                        height: sizedBoxHeight,
                        child: _phoneGridView(context, context.watch<PhoneProvider>().resources),
                      ),
                    ],
                  )
                ],
              ));
        });
  }

  GridView _phoneGridView(
    BuildContext context,
    List<PhoneModel> items,
  ) {
    Color cardShadowColor = Colors.black;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async {
            await Navigator.push(
                context, MaterialPageRoute(builder: (context) => PhoneDetailScreenView(path: [items[index]])));
          },
          child: Padding(
            padding: PaddindUtility().paddingGeneral,
            child: Card(
              shadowColor: cardShadowColor,
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: PaddindUtility().paddingCardImage,
                      child: Image.network(items[index].imageBlue.toString()),
                    ),
                  ),
                  Text(
                    '${items[index].name}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Padding(
                    padding: PaddindUtility().paddinTopBottom,
                    child: Text(
                      '${items[index].prI}',
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PhoneBasketBtn extends StatelessWidget {
  const PhoneBasketBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = 25;
    return IconButton(
      icon: Icon(Icons.shopping_basket_sharp, size: iconSize),
      onPressed: () {},
    );
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
