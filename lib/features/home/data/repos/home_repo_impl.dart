import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:programming&maxResults=40&startIndex=20',
      );
      final items = data['items'];
      if (items == null) {
        return const Right([]);
      }

      List<BookModel> books = [];
      for (var item in items) {
        books.add(BookModel.fromJson(item));
        // try {
        //   books.add(BookModel.fromJson(item));
        // } catch (e) {
        //   books.add(BookModel.fromJson(item));
        // }
        // for traking exception.....
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchHomeBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:programming',
        // volumes?q=dart+programming
        // volumes?q=flutter

      );
      final items = data['items'];
      if (items == null) {
        return const Right([]);
      }

      List<BookModel> books = [];
      for (var item in items) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=flutter',
        
      );
      final items = data['items'];
      if (items == null) {
        return const Right([]);
      }

      List<BookModel> books = [];
      for (var item in items) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
