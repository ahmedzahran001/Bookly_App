import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_books_state.dart';

class HomeBooksCubit extends Cubit<HomeBooksState> {
  HomeBooksCubit(this.homeRepo) : super(HomeBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchHomeBooks() async {
    emit(HomeBooksLoading());
    var result = await homeRepo.fetchHomeBooks();

    result.fold(
      (failure) {
        emit(HomeBooksFailure(failure.errMessage));
      },
      (books) {
        emit(HomeBooksSuccess(books));
      },
    );
  }
}
