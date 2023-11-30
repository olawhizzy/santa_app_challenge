import 'package:equatable/equatable.dart';

class SantaModel extends Equatable {
  final String name;
  final String country;
  bool isNice;

  SantaModel({required this.name, required this.country,  this.isNice = true});

  @override
  List<Object> get props => [name, country, isNice];

  //Toggles Child Status between nice and naughty
  void changeStatus() {
    isNice = !isNice;
  }
}