part of 'breed_bloc.dart';



abstract class BreedState extends Equatable {
  const BreedState();

  @override
  List<Object> get props => [];
}

class BreedInitial extends BreedState {}

class BreedLoading extends BreedState {}

class BreedLoaded extends BreedState {
  final List<Data> breeds;
  final String? nextPageUrl;

  const BreedLoaded(this.breeds, {this.nextPageUrl});

  @override
  List<Object> get props => [breeds, nextPageUrl ?? ''];
}

class BreedError extends BreedState {}
