import 'package:flutter/material.dart';
import 'package:phone_shop_app/product/constant/padding_items.dart';
import 'package:phone_shop_app/product/constant/project_items.dart';

class PhoneDetailScreenView extends StatefulWidget {
  const PhoneDetailScreenView({Key? key}) : super(key: key);
  @override
  State<PhoneDetailScreenView> createState() => _PhoneDetailScreenViewState();
}

class _PhoneDetailScreenViewState extends State<PhoneDetailScreenView> {
  @override
  Widget build(BuildContext context) {
    Size contanierSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(ProjectItems.projectName),
      ),
      body: Container(
        height: contanierSize.height * 0.82,
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)), color: Colors.white),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/deneme-befe3.appspot.com/o/ip_13_blue.jpg?alt=media&token=f4e3fc8a-ba8f-44c2-a687-f6d87c00048d',
                ),
              ),
              Text(
                'Iphone 12',
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ColorChange(color: Color.fromARGB(255, 25, 25, 25)),
                  ColorChange(color: Color.fromARGB(255, 57, 131, 192)),
                  ColorChange(color: Color.fromARGB(255, 237, 237, 237)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorChange extends StatelessWidget {
  final Color color;
  const ColorChange({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: PaddindUtility().paddingColorBtn,
          child: Container(
            padding: const EdgeInsets.all(2),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              shape: BoxShape.circle,
            ),
            child: DecoratedBox(decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          ),
        )
      ],
    );
  }
}
