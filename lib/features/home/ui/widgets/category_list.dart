import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../provider/home_provider.dart';
class CategoryList extends StatelessWidget {
  final HomeProvider homeProvider;
  const CategoryList({
    super.key, required this.homeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: homeProvider.loading
          ? Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(color: Colors.black,),
        ),
      )
          : homeProvider.categories.length==0 ? Text('No category found') : ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeProvider.categories.length,
        itemBuilder: (context, index) {
          final data = homeProvider.categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                homeProvider.setCategoryIndex(index);
                homeProvider.setCategory(data.id??'all');
              },
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                        homeProvider.categoryIndex ==
                            index
                            ? AppColors.deepPrimary
                            : Colors.grey,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.image_outlined),
                  ),
                  SizedBox(height: 5),
                  Text(
                    data.name ?? '',
                    style: AppTextStyles.textStyle(
                      14,
                      FontWeight.w500,
                      homeProvider.categoryIndex == index
                          ? AppColors.deepPrimary
                          : Color(0xFF6F7D91),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}