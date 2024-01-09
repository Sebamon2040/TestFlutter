// Dart imports:

import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';


// Project imports:
import 'package:test_consolidacion/models/pagos_model.dart';
import 'package:test_consolidacion/api/api_service.dart';


part 'pagos_state.dart';


class PagosCubit extends Cubit<PagosState>{
  final ApiService _apiService = ApiService();
  PagosCubit() : super(PagosState());

  void emitState({
    int? pagosPage,
    int? pagosTotalPages,
    bool? hasPreviousPagosPage,
    bool? hasNextPagosPage,
    List<Results>? pagos,
  }) {
    emit(PagosState(
      pagosPage: pagosPage ?? state.pagosPage,
      pagosTotalPages: pagosTotalPages ?? state.pagosTotalPages,
      hasPreviousPagosPage: hasPreviousPagosPage ?? state.hasPreviousPagosPage,
      hasNextPagosPage: hasNextPagosPage ?? state.hasNextPagosPage,
      pagos: pagos ?? state.pagos,
    ));
  }
  void resetAll(){
    emit(PagosState(
      pagosPage: 1,
      pagosTotalPages: 1,
      hasPreviousPagosPage: false,
      hasNextPagosPage: false, 
      pagos: [],
    ));
  }

  Future getPagos({int page=1}) async{
    print("ejecutando getPagos con page: $page");
    try{
      dynamic pagos = await _apiService.fetchPagos(page: page);

      
      emitState(
        pagos:pagos.results,
        pagosPage: page,
        pagosTotalPages: pagos.count,
        hasPreviousPagosPage: pagos.previous != null,
        hasNextPagosPage: pagos.next != null,
      );
    }catch(e){
      if (e is TimeoutException){
        throw('Tiempo de expera agotado, intente nuevamente');
      }else{
        throw(e.toString());
      }
    }
  }
}