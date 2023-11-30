import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sant_app_challenge/bloc/santa_bloc.dart';

import 'model/santa_model.dart';

void main() {
  runApp(
    BlocProvider<SantaBloc>(
      create: (context) => SantaBloc(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santa Christmas List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SantaScreen(),
    );
  }
}
class SantaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Santa\'s List')),
      body: BlocBuilder<SantaBloc, SantaState>(
        builder: (context, state) {

          print("this state: $state");
          state as SantaInitial;
          print("hello egbon ${state.children}");
          print('dff');
           return ListView(
            children: state.children.map((child) => ListTile(
              title: Text('Name: ${child.name}'),
              subtitle: Text('Country: ${child.country} - Status: ${child.isNice == true ? 'Nice' : 'Naughty'}'),
              onTap: () => context.read<SantaBloc>().add(ChangeChildStatus(child)),
            )).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddChildDialog(context);

        },
        child: Icon(Icons.add),
      ),
    );
  }
  void _showAddChildDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController countryController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Child'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: countryController,
                decoration: InputDecoration(labelText: 'Country'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                final String name = nameController.text;
                final String country = countryController.text;
                if (name.isNotEmpty && country.isNotEmpty) {
                  // Assuming SantaModel is your data model and SantaBloc is your Bloc
                  context.read<SantaBloc>().add(AddNewChild(SantaModel(name: name, country: country, isNice: true)));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

}
