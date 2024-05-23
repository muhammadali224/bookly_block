import 'package:bloc_book/Features/home/presentation/view_model/featured_book/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                      url:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return const AppErrorWidget(
            text: 'Something Error',
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
