import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qunova/core/constants/app_color.dart';
import 'package:qunova/core/constants/app_text_style.dart';
import 'package:qunova/core/widgets/custom_button.dart';
import 'package:qunova/features/home/provider/home_provider.dart';

import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/empty_state.dart';
import '../widgets/category_list.dart';
import '../widgets/contact_list.dart';

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
  void dispose() {
    super.dispose();
    context.read<HomeProvider>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: GestureDetector(
        onTap: () {
          // open bottom modal sheet
          _openModalBottomSheet(context);
        },
        child: Image.asset(
          'assests/icon/Floating Icon.png',
          height: 100,
          width: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                homeProvider.isOpenSearch
                    ? _searchField(homeProvider)
                    : Row(
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
                          GestureDetector(
                            onTap: () {
                              homeProvider.setSearchBox(true);
                            },
                            child: Image.asset(
                              'assests/icon/search.png',
                              height: 25,
                              width: 25,
                            ),
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
                CategoryList(homeProvider: homeProvider),
                SizedBox(height: 10),
                homeProvider.filteredContacts.length == 0 &&
                        homeProvider.loading == false
                    ? Column(
                        children: [
                          SizedBox(height: 40),
                          EmptyState(
                            onTap: () {
                              // open modal bottom sheet
                              _openModalBottomSheet(context);
                            },
                          ),
                        ],
                      )
                    : homeProvider.index == 1
                    ? Column(
                        children: [
                          SizedBox(height: 40),
                          EmptyState(
                            onTap: () {
                              // open modal bottom sheet
                              _openModalBottomSheet(context);
                            },
                          ),
                        ],
                      )
                    : ContactList(homeProvider: homeProvider),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<dynamic> _openModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: AppColors.background,
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.8,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    CustomTextField(hintText: 'Name'),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: '+880 1812 432 654',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                'assests/icon/Icon-Flag-America.png',
                              ),
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              'assests/icon/chevron-down.png',
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextField(hintText: 'Desgination'),
                    SizedBox(height: 15),
                    CustomTextField(hintText: 'Company'),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: 'Relation',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image.asset('assests/icon/chevron-down.png'),
                      ),
                    ),
                    SizedBox(height: 25),
                    CustomButton(
                      fontWeight: FontWeight.bold,
                      btnText: 'Save Contact',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      backgroundColor: AppColors.background,
                      foregroundColor: Color(0xFF717978),
                      borderColor: Color(0xFF717978),
                      btnText: 'Cancel',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
  }

  Widget _searchField(HomeProvider homeProvider) {
    return TextField(
      onChanged: (value) {
        print(value);
        homeProvider.updateSearchQuery(value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFCBD5E1)),
        ),
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFCBD5E1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xFFCBD5E1)),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            homeProvider.setSearchBox(false);
            homeProvider.updateSearchQuery('');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assests/icon/x.png', height: 20, width: 20),
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
