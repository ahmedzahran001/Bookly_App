import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_books_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitialState());

  final SearchBooksRepo searchRepo;

  Future<void> searchBooks({required String bookName}) async {
    
    emit(SearchBooksLoadingState());
    var result = await searchRepo.searchBooks(bookName: bookName);

    result.fold(
      (failure) {
        emit(SearchBooksFailureState(failure.errMessage));
      },
      (books) {
        emit(SearchBooksSuccessState(books));
      },
    );
  }
}
