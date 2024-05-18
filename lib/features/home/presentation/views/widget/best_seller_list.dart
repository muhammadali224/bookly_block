import 'package:flutter/material.dart';

import '../../../../../core/constant/text_style.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 125,
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.5 / 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            child: const Text(
                              "Harry Potter And the Goblet of Fire",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textStyle20,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "J.K. Rowling",
                            style: AppTextStyle.textStyle14,
                          ),
                          const SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "19.99 E",
                                style: AppTextStyle.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFFDD4F),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "4.0",
                                    style: AppTextStyle.textStyle16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "(256)",
                                    style: AppTextStyle.textStyle14
                                        .copyWith(color: Colors.grey.shade300),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
