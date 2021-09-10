import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/Item_widget.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    // print(productsData);

    // setState is use to inform the page that something has updated
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ?
            //   ListView.builder(
            //   itemCount: CatalogModel.items.length,
            //   itemBuilder: (context, index) {
            //     return ItemWidget(
            //       item: CatalogModel.items[index],
            //     );
            //   },
            // )
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                    
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: GridTile(
                      child: Image.network(item.image),
                      header: Container(
                        child: Text(item.name,style: TextStyle(color: Colors.white),),

                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple
                        ),
                      ),
                      footer:Container(
                        child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),

                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black
                        ),
                      ), 
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: LinearProgressIndicator(),
              ),
      ),
      // body: Center(
      //   child: Container(
      //     child: Text("welcome to $days of flutter by $name"),
      //   ),

      // ),
      drawer: MyDrawer(),
    );
  }
}
