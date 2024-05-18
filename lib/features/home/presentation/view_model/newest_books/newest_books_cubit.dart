import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/error_handling.dart';
import '../../../data/model/book_model.dart';
import '../../../data/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchFeatureBook();
    if (result.$1.runtimeType == ServerFailure) {
      emit(NewestBooksFailure(errorMessage: "errorMessage"));
    } else if (result.$1.runtimeType == ServerSuccess) {
      emit(NewestBooksSuccess(books: result.$2!));
    }
  }
}
