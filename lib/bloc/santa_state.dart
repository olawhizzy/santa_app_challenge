part of 'santa_bloc.dart';

@immutable
abstract class SantaState extends Equatable {
  @override
  List<Object> get props => [];
}

//Initial state for all children
class SantaInitial extends SantaState {
  final List<SantaModel> children;

  SantaInitial({this.children = const []});

  @override
  List<Object> get props => [children];
  SantaInitial copyWith({List<SantaModel>? newchildren}) {
    return SantaInitial(children: newchildren ?? this.children);
  }
}

