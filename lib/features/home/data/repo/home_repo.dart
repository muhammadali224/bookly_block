import '../../../../core/error/error_handling.dart';
import '../model/book_model.dart';

abstract class HomeRepo {
  Future<(Failure?, List<BookModel>?)> fetchFeatureBook();

  Future<(Failure?, List<BookModel>?)> fetchBestSeller();
}
