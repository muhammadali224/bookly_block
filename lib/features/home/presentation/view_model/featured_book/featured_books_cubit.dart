import 'package:bloc/bloc.dart';
import 'package:bloc_book/Features/home/data/repo/home_repo.dart';

import '../../../data/model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeatureBook();

    result.fold((failure) {
      emit(FeaturedBooksFailure(
        errorMessage: failure.message,
      ));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
