import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qunova/core/constants/app_color.dart';
import 'package:qunova/core/constants/app_text_style.dart';
import 'package:qunova/features/home/provider/home_provider.dart';

import '../../../../core/widgets/empty_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // after complete build then call api
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<HomeProvider>(
            builder: (context, homeProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      _headerSelect(
                        text: 'Contact',
                        homeProvider: homeProvider,
                        index: 0,
                        isSelected: homeProvider.index == 0,
                      ),
                      SizedBox(width: 25),
                      _headerSelect(
                        text: 'Recent',
                        homeProvider: homeProvider,
                        index: 1,
                        isSelected: homeProvider.index == 1,
                      ),
                      Spacer(),
                      Image.asset(
                        'assests/icon/search.png',
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(width: 30),
                      Image.asset(
                        'assests/icon/align-right.png',
                        height: 25,
                        width: 25,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: homeProvider.loading ? Center(
                      child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()),
                    ) : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeProvider.categories.length,
                      itemBuilder: (context, index) {
                        final data = homeProvider.categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            homeProvider.setCategoryIndex(index);
                          },
                          child: Column(
                           // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(color: homeProvider.categoryIndex==index ? AppColors.deepPrimary : Colors.grey),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.image_outlined),
                              ),
                              SizedBox(height: 5,),
                              Text(data.name??'',style: AppTextStyles.textStyle(14, FontWeight.w500, homeProvider.categoryIndex==index ? AppColors.deepPrimary : Color(0xFF6F7D91)),)
                            ],
                          ),
                        ),
                      );
                    },),
                  )

                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _headerSelect({
    required HomeProvider homeProvider,
    required String text,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        homeProvider.setIndex(index);
      },
      child: Column(
        children: [
          Text(
            text,
            style: AppTextStyles.textStyle(
              18,
              FontWeight.w500,
              isSelected ? AppColors.subSecondary : AppColors.grey,
            ),
          ),
          if (isSelected)
            Container(width: 80, height: 2, color: AppColors.primary),
        ],
      ),
    );
  }
}


