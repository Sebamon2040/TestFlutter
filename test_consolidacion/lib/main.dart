import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_consolidacion/blocs/pagos/pagos_cubit.dart';
import 'package:test_consolidacion/screens/pagos_screen.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PagosCubit(),
        child: PagosScreen(),
      ),
    );
  }
}