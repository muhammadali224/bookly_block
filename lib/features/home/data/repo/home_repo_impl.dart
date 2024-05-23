import 'package:bloc_book/Features/home/data/model/book_model.dart';
import 'package:bloc_book/Features/home/data/repo/home_repo.dart';
import 'package:bloc_book/core/error/error_handling.dart';
import 'package:bloc_book/core/services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSeller() async {
    try {
      var data = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&q=subject:programming");
      List response = data['items'];
      List<BookModel> books = [];

      books.addAll(response.map((e) => BookModel.fromJson(e)));
      print(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBook() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest");
      List response = data['items'];
      List<BookModel> books = [];

      books.addAll(response.map((e) => BookModel.fromJson(e)));
      print(books);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
