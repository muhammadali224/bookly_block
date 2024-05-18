import 'package:bloc/bloc.dart';
import 'package:bloc_book/Features/home/data/repo/home_repo.dart';
import 'package:bloc_book/core/error/error_handling.dart';

import '../../../data/model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeatureBook();
    if (result.$1.runtimeType == ServerFailure) {
      emit(FeaturedBooksFailure(errorMessage: "errorMessage"));
    } else if (result.$1.runtimeType == ServerSuccess) {
      emit(FeaturedBooksSuccess(books: result.$2!));
    }
  }
}
