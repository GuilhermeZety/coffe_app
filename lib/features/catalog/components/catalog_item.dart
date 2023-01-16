import 'package:coffe_app/core/constants/app_colors.dart';
import 'package:coffe_app/core/services/navigate_service.dart';
import 'package:coffe_app/features/product/presenter/ui/product_presenter.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({super.key, required this.image, required this.title, required this.description, required this.price});

  final String image;
  final String title;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigate.to(context, ProductPresenter(image: image,)),
          child: Container(
            width: 200,
            height: 300,
            margin: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [              
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration( 
                      color: AppColors.brown_50,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: AppColors.brown_500.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(Icons.star, size: 15, color: AppColors.brown_500,),
                                      Text('4.7')
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(description, style: TextStyle(fontSize: 13, color: AppColors.black_900.withOpacity(0.5)),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Text('\$ ${price}0', style: const TextStyle())
                                  ],
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Hero(
                    tag: image,
                    child: Image.asset(image)
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}