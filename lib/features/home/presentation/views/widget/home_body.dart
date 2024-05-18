import 'package:bloc_book/core/constant/text_style.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'best_seller_list.dart';
import 'home_list_view.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              HomeListView(),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Best Seller",
                  style: AppTextStyle.textStyle18,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: BestSellerList(),
          ),
        ),
      ],
    );
  }
}
