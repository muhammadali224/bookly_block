import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchBestSeller();
    result.fold((failure) {
      emit(NewestBooksFailure(
        errorMessage: failure.message,
      ));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
