import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_books_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchBooksRepoImpl extends SearchBooksRepo {
  final ApiService apiService;

  SearchBooksRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> searchBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=subject:programming&Sorting=relevance',
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
