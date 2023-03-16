import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitial());

  void fetch() {
    emit(
      ListLoaded(list: _buildList()),
    );
  }

  List<int> _buildList() {
    final List<int> list = [];
    for (int i = 0; i < 150; i++) {
      list.add(i);
    }
    return list;
  }
}
