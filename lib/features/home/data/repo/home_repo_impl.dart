import 'package:bloc_book/Features/home/data/model/book_model.dart';
import 'package:bloc_book/Features/home/data/repo/home_repo.dart';
import 'package:bloc_book/core/error/error_handling.dart';
import 'package:bloc_book/core/services/api_services.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<(Failure?, List<BookModel>?)> fetchBestSeller() async {
    try {
      var data = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&q=subject:programming");
      List response = data['items'];
      List<BookModel> books = [];

      books.addAll(response.map((e) => BookModel.fromJson(e)));
      return books.isNotEmpty
          ? (ServerSuccess(message: "success"), books)
          : (ServerEmptyData(message: "no data"), null);
    } catch (e) {
      if (e is DioException) {
        return (ServerFailure.fromDioError(e), <BookModel>[]);
      }
      return (ServerFailure(message: "$e"), null);
    }
  }

  @override
  Future<(Failure?, List<BookModel>?)> fetchFeatureBook() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest");
      List response = data['items'];
      List<BookModel> books = [];

      books.addAll(response.map((e) => BookModel.fromJson(e)));
      return books.isNotEmpty
          ? (ServerSuccess(message: "success"), books)
          : (ServerEmptyData(message: "no data"), null);
    } catch (e) {
      if (e is DioException) {
        return (ServerFailure.fromDioError(e), <BookModel>[]);
      }
      return (ServerFailure(message: "$e"), null);
    }
  }
}
