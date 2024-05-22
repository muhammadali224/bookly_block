import 'package:dartz/dartz.dart';

import '../../../../core/error/error_handling.dart';
import '../model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeatureBook();

  Future<Either<Failure, List<BookModel>>> fetchBestSeller();
}
