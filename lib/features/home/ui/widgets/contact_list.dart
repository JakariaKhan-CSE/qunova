import 'package:flutter/material.dart';

import '../../../../core/constants/app_text_style.dart';
import '../../provider/home_provider.dart';
class ContactList extends StatelessWidget {
  final HomeProvider homeProvider;
  const ContactList({
    super.key, required this.homeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: homeProvider.filteredContacts.length,
        itemBuilder: (context, index) {
          final data = homeProvider.filteredContacts[index];
          return Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      data.avatarUrl ??
                          'https://png.pngtree.com/png-clipart/20230917/original/pngtree-no-image-available-icon-flatvector-illustration-thumbnail-graphic-illustration-vector-png-image_12323920.png',
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name ?? 'unknown',
                        style: AppTextStyles.textStyle(
                          18,
                          FontWeight.w500,
                          Color(0xFF475569),
                        ),
                      ),
                      Text(
                        data.phone ?? 'not find',
                        style: AppTextStyles.textStyle(
                          16,
                          FontWeight.w400,
                          Color(0xFF64758B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              if(homeProvider.filteredContacts.length-1 != index)
                Divider(color: Color(0xFFCBD5E1),),
            ],
          );
        },
      ),
    );
  }
}