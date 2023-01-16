import 'package:coffe_app/core/components/incomplete_border.dart';
import 'package:coffe_app/core/constants/app_assets.dart';
import 'package:coffe_app/core/constants/app_colors.dart';
import 'package:coffe_app/core/services/navigate_service.dart';
import 'package:coffe_app/core/utils/util.dart';
import 'package:coffe_app/features/catalog/presenter/ui/catalog_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePresenter extends StatefulWidget {
  const HomePresenter({super.key});

  @override
  State<HomePresenter> createState() => _HomePresenterState();
}

class _HomePresenterState extends State<HomePresenter> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20),
        child: IncompleteBorder(
          width: 95, 
          height: 95,
          child: Container(
            decoration: BoxDecoration(            
              color: AppColors.black_900,
              borderRadius: BorderRadius.circular(20)
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios, 
                color: AppColors.brown_100,
              ), onPressed: () => Navigate.to(
                context, 
                const CatalogPresenter(), 
                type: TypeTransition.direction, 
                direction: AxisDirection.left,
                duration: const Duration(milliseconds: 300)
              ),),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: Util.screenWidth(context),
          height: Util.screenHeight(context),
          child: Stack(
            children: [
              Positioned(
                top: -120,
                right: -10,
                child: SizedBox(
                  height: Util.screenHeight(context) * 0.8,
                  child: Image.asset(AppAssets.coffeeTree, 
                    width: Util.screenWidth(context) * 0.8,
                    fit: BoxFit.fitWidth
                  )
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  child: Image.asset(AppAssets.coffees, 
                    height: Util.screenHeight(context) * 0.3,
                    color: Colors.brown,
                  )
                ),
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Util.screenWidth(context) * 0.45),
                              child: IncompleteBorder(
                                width: 60,
                                height: 60,
                                child: SvgPicture.asset(AppAssets.coffeIconSvg, width: 50, height: 50,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: Util.screenWidth(context) * 0.1),
                              child: const Text('My\nCoffee\nShop', style: TextStyle(fontSize: 60),),
                            ),
                            const Text('Your unique app\nto buy Coffe!', 
                              style: TextStyle(
                                color: AppColors.brown_500,
                                fontSize: 20
                              ),
                            )
                          ],
                        ),
                      ),                
                      const Expanded(
                        child: SizedBox(
                          width: 1,
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: const [
                      
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}