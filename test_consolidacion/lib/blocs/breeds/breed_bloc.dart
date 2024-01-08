import 'package:equatable/equatable.dart';
import '../../models/breed_model.dart';
import '../../api/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  final ApiRepository apiRepository;
  int currentPage = 1;

  BreedBloc({required this.apiRepository}) : super(BreedInitial()) {
    on<FetchBreeds>((event, emit) async {
      try {
        currentPage = event.page;
        final breeds = await apiRepository.fetchBreeds(page: currentPage);
        emit(BreedLoaded(breeds));
      } catch (_) {
        emit(BreedError());
      }
    });
  }
}