import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:sant_app_challenge/bloc/santa_bloc.dart';
import 'package:sant_app_challenge/model/santa_model.dart';


void main() {
  group('SantaBloc', () {
    // Test for adding a new child
    blocTest<SantaBloc, SantaState>(
      'emits [SantaInitial] with a new child when AddNewChild is added',
      build: () => SantaBloc(),
      act: (bloc) => bloc.add(AddNewChild(SantaModel(name: 'John', country: 'USA', isNice: true))),
      expect: () => [
        SantaInitial(children: [SantaModel(name: 'John', country: 'USA', isNice: true)])
      ],
    );

    // Test for changing a child's status
    blocTest<SantaBloc, SantaState>(
      'emits [SantaInitial] with updated child status when ChangeChildStatus is added',
      build: () => SantaBloc(),
      act: (bloc) {
        var child = SantaModel(name: 'John', country: 'USA');
        bloc.add(AddNewChild(child));
        bloc.add(ChangeChildStatus(child));
      },
      expect: () => [
        SantaInitial(children: [SantaModel(name: 'John', country: 'USA', isNice: true)]),
        isA<SantaInitial>().having((state) => state.children.first.isNice, 'isNice', false),
      ],
    );
  });
}