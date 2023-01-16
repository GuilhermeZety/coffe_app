import 'package:coffe_app/core/constants/app_assets.dart';
import 'package:coffe_app/core/constants/app_colors.dart';
import 'package:coffe_app/core/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/catalog_item.dart';

class CatalogPresenter extends StatefulWidget {
  const CatalogPresenter({super.key});

  @override
  State<CatalogPresenter> createState() => _CatalogPresenterState();
}

class _CatalogPresenterState extends State<CatalogPresenter> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.brown_100,          
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {}, 
                icon: SvgPicture.asset(AppAssets.menuIconSvg, width: 20, height: 20,)
              )
            ],
          ),
        ),
        foregroundColor: AppColors.black_900,
        elevation: 0,          
        toolbarHeight: 100,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),                  
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search
                  )
                ),
              ),
            ],
          )
        ],          
      ),
      body: SizedBox(
        width: Util.screenWidth(context),
        height: Util.screenHeight(context) - 100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text('Morning\nBegins with Senses', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),)
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.brown_500, width: 2, )
                        )
                      ),
                      padding: const EdgeInsets.only(bottom: 2),
                      child: const Text('Popular', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.black_900 ),)
                    ), 
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text('Recent', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black_900.withOpacity(0.5)),)
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text('Best rating', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black_900.withOpacity(0.5)),)
                    ),

                   
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: Util.screenWidth(context),
                  height: 500,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CatalogItem(
                        image: AppAssets.cupCoffee,
                        title: 'Expresso',
                        description: 'The best of coffee in your hands.',
                        price: 3.5
                      ),
                      CatalogItem(
                        image: AppAssets.cupCappuccino,
                        title: 'Cappuccino',
                        description: 'The best of chocolat and coffee.',
                        price: 4.5
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}