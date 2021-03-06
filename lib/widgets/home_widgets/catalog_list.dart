import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';


class CatalogList extends StatefulWidget {
  CatalogList({Key? key}) : super(key: key);

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.color(context.accentColor).make(),
            catalog.desc.text.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: "Add to Cart".text.make(),
                )
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}