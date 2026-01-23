part of 'home_books_cubit.dart';

abstract class HomeBooksState extends Equatable {
  const HomeBooksState();

  @override
  List<Object> get props => [];
}

class HomeBooksInitial extends HomeBooksState {}

class HomeBooksLoading extends HomeBooksState {}

class HomeBooksSuccess extends HomeBooksState {
  final List<BookModel> books;
  const HomeBooksSuccess(this.books);
}

class HomeBooksFailure extends HomeBooksState {
  final String errMessage;
  const HomeBooksFailure(this.errMessage);
}
