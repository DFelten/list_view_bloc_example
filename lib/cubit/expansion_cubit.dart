import 'package:flutter_bloc/flutter_bloc.dart';

part 'expansion_state.dart';

class ExpansionCubit extends Cubit<ExpansionState> {
  ExpansionCubit() : super(TileNotExpanded());

  void toggle() {
    emit(state is TileExpanded ? TileNotExpanded() : TileExpanded());
  }
}
