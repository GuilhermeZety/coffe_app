import 'package:coffe_app/core/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';


class ProductPresenter extends StatefulWidget {
  const ProductPresenter({super.key, required this.image});

  final String image;

  @override
  State<ProductPresenter> createState() => _ProductPresenterState();
}

class _ProductPresenterState extends State<ProductPresenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Stack(
        children: [   
             
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: Util.screenHeight(context) * 0.4,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.brown.shade600,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.brown_500.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors.black_900,
                width: Util.screenWidth(context),
                height: Util.screenHeight(context) * 0.6,
                child: Column(
                  children: [
                    Container(
                      height: Util.screenHeight(context) * 0.5,
                      decoration: const BoxDecoration(
                        color: AppColors.brown_100,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                      ),
                      padding: EdgeInsets.only(top: Util.screenHeight(context) * 0.12, bottom: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Expresso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('200ml of the best espresso, made with great love with 100% Arabica coffee', style: TextStyle(fontSize: 16, color: AppColors.black_900.withOpacity(0.5)),),
                          ),
                        ],
                      )
                    ),
                    SizedBox(
                      width: Util.screenWidth(context),
                      height: Util.screenHeight(context) * 0.1,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -1,
                            child: Container(
                              color: AppColors.brown_100,
                              width: (Util.screenWidth(context) / 2) - 49,
                              height: 40,
                            ),
                          ),
                          Positioned(
                            top: -1,
                            bottom: 0,
                            child: Container(
                              decoration: const BoxDecoration(                                
                                color: AppColors.black_900,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20))
                              ),
                              width: (Util.screenWidth(context) / 2) - 46,
                              height: 40,
                            ),
                          ),
                          Positioned(
                            top: -1,
                            right: 0,
                            child: Container(
                              color: AppColors.brown_100,
                              width: (Util.screenWidth(context) / 2) - 49,
                              height: 40,
                            ),
                          ),
                          Positioned(
                            top: -1,
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(                                
                                color: AppColors.black_900,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                              ),
                              width: (Util.screenWidth(context) / 2) - 46,
                              height: 40,
                            ),
                          ),
                          Positioned(
                            top: -1,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(                                    
                                    color: AppColors.brown_100,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    )
                                  ),
                                  width: 100,
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -5,
                            right: 0,
                            left: 0,
                            child: Dismissible(
                              key: Key(widget.image),
                              child: const Icon(Icons.keyboard_arrow_up_rounded, size: 36,)
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Buy Now!', style: TextStyle(color: AppColors.brown_50, fontSize: 20),),
                                ],
                              )
                            ),
                          ),
                        ],
                      ),
                    )
                  
                  ],
                ),
              ),             
            ],
          ),
          AppBar(
            backgroundColor: Colors.transparent,          
            leadingWidth: 80,
            foregroundColor: AppColors.black_900,
            elevation: 0,          
            toolbarHeight: 100,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),                  
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.brown_100.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(1000)
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAssets.heartIconSvg, width: 25, color: Colors.red,)
                      ),
                    ),
                  ),
                ],
              )
            ],          
          ),
          SizedBox(
            width: double.infinity,
            height: Util.screenHeight(context) * 0.7,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Hero(
                  tag: widget.image,
                  child: Image.asset(widget.image)
                ),
              ),
            ),
          ),          
        ],
      ),
    );
  }
}