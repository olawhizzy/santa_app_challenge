part of 'santa_bloc.dart';

@immutable
abstract class SantaEvent {}

//Event for new Child
class AddNewChild extends SantaEvent {
  final SantaModel newChild;

  AddNewChild(this.newChild);

}

//EVent for changing child status
class ChangeChildStatus extends SantaEvent {
  final SantaModel changeChild;

  ChangeChildStatus(this.changeChild);

}