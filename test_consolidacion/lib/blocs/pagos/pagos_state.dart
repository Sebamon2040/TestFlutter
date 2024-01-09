part of 'pagos_cubit.dart'; 

class PagosState{
  int pagosPage;
  int pagosTotalPages;
  bool hasPreviousPagosPage;
  bool hasNextPagosPage;
  List<Results> pagos;

  PagosState({
    this.pagosPage = 1,
    this.pagosTotalPages = 1,
    this.hasPreviousPagosPage = false,
    this.hasNextPagosPage = false,
    this.pagos = const [],
  });
}