
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sant_app_challenge/model/santa_model.dart';

part 'santa_event.dart';
part 'santa_state.dart';

class SantaBloc extends Bloc<SantaEvent, SantaState> {
  SantaBloc() : super(SantaInitial()) {
    //handling the new child
    on<AddNewChild>(_onAddNewChild);
    // handling the child status
    on<ChangeChildStatus>(__onChangeChildStatus);
  }
  void _onAddNewChild(AddNewChild event, Emitter<SantaState> emit) {
      final currentState = state as SantaInitial;
      final updatedChildren = List<SantaModel>.from(currentState.children)..add(event.newChild);

      emit(SantaInitial(children: updatedChildren));
  }

  void __onChangeChildStatus(ChangeChildStatus event, Emitter<SantaState> emit){
    final currentState = state as SantaInitial;
    final updatedChildren = currentState.children.map((e) {
      if(e == event.changeChild) {
        return SantaModel(country: e.country, isNice: !e.isNice, name: e.name);
      }
      return e;
    }).toList();
    emit(SantaInitial(children: updatedChildren));
  }
}
