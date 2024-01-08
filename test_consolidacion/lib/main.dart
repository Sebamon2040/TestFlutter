import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/breed_page.dart'; // Asegúrate de usar la ruta correcta a tu archivo breed_page.dart
import 'blocs/breeds/breed_bloc.dart'; // Asegúrate de usar la ruta correcta a tu archivo breed_bloc.dart
import 'api/api_repository.dart'; // Asegúrate de usar la ruta correcta a tu archivo api_repository.dart

void main() {
  runApp(MainApp());
}


class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => BreedBloc(apiRepository: ApiRepository())..add(FetchBreeds()),
        child: BreedPage(),
      ),
    );
  }
}