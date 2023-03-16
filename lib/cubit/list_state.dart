part of 'list_cubit.dart';

abstract class ListState {}

class ListInitial extends ListState {}

class ListLoaded extends ListState {
  ListLoaded({required this.list});

  final List<int> list;
}
