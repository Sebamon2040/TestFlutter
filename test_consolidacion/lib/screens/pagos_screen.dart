import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_consolidacion/blocs/pagos/pagos_cubit.dart';


class PagosScreen extends StatefulWidget {
  @override
  _PagosScreenState createState() => _PagosScreenState();
}

class _PagosScreenState extends State<PagosScreen> {
  Future? _pagosFuture;

  @override
  void initState() {
    super.initState();
    _pagosFuture = context.read<PagosCubit>().getPagos(); // Get pagos when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagos'),
      ),
      body: FutureBuilder(
        future: _pagosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return BlocBuilder<PagosCubit, PagosState>(
              builder: (context, state) {
                if (state.pagos.isEmpty) {
                  return Center(child: Text('No hay pagos disponibles'));
                } else {
                  return ListView.builder(
                    itemCount: state.pagos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Pago ID: ${state.pagos[index].id}'),
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}