import 'package:bloc_book/Features/home/data/repo/home_repo_impl.dart';
import 'package:bloc_book/Features/home/presentation/view_model/featured_book/featured_books_cubit.dart';
import 'package:bloc_book/Features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:bloc_book/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() {
  setupGetIt();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())),
        BlocProvider(
            create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
