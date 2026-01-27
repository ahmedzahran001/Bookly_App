part of 'search_books_cubit.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

class SearchBooksInitialState extends SearchBooksState {}

class SearchBooksLoadingState extends SearchBooksState {}

class SearchBooksSuccessState extends SearchBooksState {
  final List<BookModel> books;
  const SearchBooksSuccessState(this.books);
}

class SearchBooksFailureState extends SearchBooksState {
  final String errMessage;
  const SearchBooksFailureState(this.errMessage);
}
