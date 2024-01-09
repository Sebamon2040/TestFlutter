class Pagos {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  Pagos({this.count, this.next, this.previous, this.results});

  Pagos.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  int? monto;
  String? fecha;
  String? detalles;
  int? cuotas;
  Venta? venta;
  Voucher? voucher;
  int? recaudador;
  Plaza? plaza;
  MedioDePago? medioDePago;
  String? pagoVerificado;
  String? fotografiaComprobante;
  bool? validacion;
  String? idMetodoPago;
  List<ConciliacionPago>? conciliacionPago;
  bool? revision;

  Results(
      {this.id,
      this.monto,
      this.fecha,
      this.detalles,
      this.cuotas,
      this.venta,
      this.voucher,
      this.recaudador,
      this.plaza,
      this.medioDePago,
      this.pagoVerificado,
      this.fotografiaComprobante,
      this.validacion,
      this.idMetodoPago,
      this.conciliacionPago,
      this.revision});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    monto = json['monto'];
    fecha = json['fecha'];
    detalles = json['detalles'];
    cuotas = json['cuotas'];
    venta = json['venta'] != null ? Venta.fromJson(json['venta']) : null;
    voucher =
        json['voucher'] != null ? Voucher.fromJson(json['voucher']) : null;
    recaudador = json['recaudador'];
    plaza = json['plaza'] != null ? Plaza.fromJson(json['plaza']) : null;
    medioDePago = json['medio_de_pago'] != null
        ? MedioDePago.fromJson(json['medio_de_pago'])
        : null;
    pagoVerificado = json['pago_verificado'];
    fotografiaComprobante = json['fotografia_comprobante'];
    validacion = json['validacion'];
    idMetodoPago = json['id_metodo_pago'];
    if (json['conciliacion_pago'] != null) {
      conciliacionPago = <ConciliacionPago>[];
      json['conciliacion_pago'].forEach((v) {
        conciliacionPago!.add(ConciliacionPago.fromJson(v));
      });
    }
    revision = json['revision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['monto'] = monto;
    data['fecha'] = fecha;
    data['detalles'] = detalles;
    data['cuotas'] = cuotas;
    if (venta != null) {
      data['venta'] = venta!.toJson();
    }
    if (voucher != null) {
      data['voucher'] = voucher!.toJson();
    }
    data['recaudador'] = recaudador;
    if (plaza != null) {
      data['plaza'] = plaza!.toJson();
    }
    if (medioDePago != null) {
      data['medio_de_pago'] = medioDePago!.toJson();
    }
    data['pago_verificado'] = pagoVerificado;
    data['fotografia_comprobante'] = fotografiaComprobante;
    data['validacion'] = validacion;
    data['id_metodo_pago'] = idMetodoPago;
    if (conciliacionPago != null) {
      data['conciliacion_pago'] =
          conciliacionPago!.map((v) => v.toJson()).toList();
    }
    data['revision'] = revision;
    return data;
  }
}

class Venta {
  int? montoTotal;
  Persona? persona;
  String? producto;

  Venta({this.montoTotal, this.persona, this.producto});

  Venta.fromJson(Map<String, dynamic> json) {
    montoTotal = json['monto_total'];
    persona =
        json['persona'] != null ? Persona.fromJson(json['persona']) : null;
    producto = json['producto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['monto_total'] = montoTotal;
    if (persona != null) {
      data['persona'] = persona!.toJson();
    }
    data['producto'] = producto;
    return data;
  }
}

class Persona {
  int? id;
  String? nombre;
  String? email;
  String? telefono;
  int? ejecutivo;
  int? pais;
  String? numeroPaciente;
  bool? altaPaciente;
  bool? fueraGarantia;

  Persona(
      {this.id,
      this.nombre,
      this.email,
      this.telefono,
      this.ejecutivo,
      this.pais,
      this.numeroPaciente,
      this.altaPaciente,
      this.fueraGarantia});

  Persona.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    email = json['email'];
    telefono = json['telefono'];
    ejecutivo = json['ejecutivo'];
    pais = json['pais'];
    numeroPaciente = json['numero_paciente'];
    altaPaciente = json['alta_paciente'];
    fueraGarantia = json['fuera_garantia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['email'] = email;
    data['telefono'] = telefono;
    data['ejecutivo'] = ejecutivo;
    data['pais'] = pais;
    data['numero_paciente'] = numeroPaciente;
    data['alta_paciente'] = altaPaciente;
    data['fuera_garantia'] = fueraGarantia;
    return data;
  }
}

class Voucher {
  int? monto;
  Persona? persona;
  String? productoEsperado;

  Voucher({this.monto, this.persona, this.productoEsperado});

  Voucher.fromJson(Map<String, dynamic> json) {
    monto = json['monto'];
    persona =
        json['persona'] != null ? Persona.fromJson(json['persona']) : null;
    productoEsperado = json['producto_esperado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['monto'] = monto;
    if (persona != null) {
      data['persona'] = persona!.toJson();
    }
    data['producto_esperado'] = productoEsperado;
    return data;
  }
}

class Plaza {
  int? id;
  String? nombrePlaza;
  String? comuna;
  String? direccion;
  double? latitud;
  double? longitud;
  int? pais;

  Plaza(
      {this.id,
      this.nombrePlaza,
      this.comuna,
      this.direccion,
      this.latitud,
      this.longitud,
      this.pais});

  Plaza.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombrePlaza = json['nombre_plaza'];
    comuna = json['comuna'];
    direccion = json['direccion'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    pais = json['pais'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre_plaza'] = nombrePlaza;
    data['comuna'] = comuna;
    data['direccion'] = direccion;
    data['latitud'] = latitud;
    data['longitud'] = longitud;
    data['pais'] = pais;
    return data;
  }
}

class MedioDePago {
  int? id;
  Pais? pais;
  String? nombre;
  String? tipo;
  bool? avalible;

  MedioDePago({this.id, this.pais, this.nombre, this.tipo, this.avalible});

  MedioDePago.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pais = json['pais'] != null ? Pais.fromJson(json['pais']) : null;
    nombre = json['nombre'];
    tipo = json['tipo'];
    avalible = json['avalible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (pais != null) {
      data['pais'] = pais!.toJson();
    }
    data['nombre'] = nombre;
    data['tipo'] = tipo;
    data['avalible'] = avalible;
    return data;
  }
}

class Pais {
  int? id;
  String? nombre;
  String? linkVideoAtencion;
  int? horasDiferenciaSantiago;

  Pais(
      {this.id,
      this.nombre,
      this.linkVideoAtencion,
      this.horasDiferenciaSantiago});

  Pais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    linkVideoAtencion = json['link_video_atencion'];
    horasDiferenciaSantiago = json['horas_diferencia_santiago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['link_video_atencion'] = linkVideoAtencion;
    data['horas_diferencia_santiago'] = horasDiferenciaSantiago;
    return data;
  }
}

class ConciliacionPago {
  Responsable? responsable;
  String? fechaConciliacion;
  Pago? pago;
  String? errores;

  ConciliacionPago(
      {this.responsable, this.fechaConciliacion, this.pago, this.errores});

  ConciliacionPago.fromJson(Map<String, dynamic> json) {
    responsable = json['responsable'] != null
        ? Responsable.fromJson(json['responsable'])
        : null;
    fechaConciliacion = json['fecha_conciliacion'];
    pago = json['pago'] != null ? Pago.fromJson(json['pago']) : null;
    errores = json['errores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (responsable != null) {
      data['responsable'] = responsable!.toJson();
    }
    data['fecha_conciliacion'] = fechaConciliacion;
    if (pago != null) {
      data['pago'] = pago!.toJson();
    }
    data['errores'] = errores;
    return data;
  }
}

class Responsable {
  int? id;
  int? prospectosAsignados;
  String? telefono;
  String? email;
  String? emailPersonal;
  String? fechaNacimiento;
  String? avatar;
  String? firebaseRegistrationId;
  int? user;
  int? plaza;
  int? pais;
  int? cargo;
  List<int>? groups;
  List<int>? permisos;

  Responsable(
      {this.id,
      this.prospectosAsignados,
      this.telefono,
      this.email,
      this.emailPersonal,
      this.fechaNacimiento,
      this.avatar,
      this.firebaseRegistrationId,
      this.user,
      this.plaza,
      this.pais,
      this.cargo,
      this.groups,
      this.permisos});

  Responsable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prospectosAsignados = json['prospectos_asignados'];
    telefono = json['telefono'];
    email = json['email'];
    emailPersonal = json['email_personal'];
    fechaNacimiento = json['fecha_nacimiento'];
    avatar = json['avatar'];
    firebaseRegistrationId = json['firebase_registration_id'];
    user = json['user'];
    plaza = json['plaza'];
    pais = json['pais'];
    cargo = json['cargo'];
    groups = json['groups'].cast<int>();
    permisos = json['permisos'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['prospectos_asignados'] = prospectosAsignados;
    data['telefono'] = telefono;
    data['email'] = email;
    data['email_personal'] = emailPersonal;
    data['fecha_nacimiento'] = fechaNacimiento;
    data['avatar'] = avatar;
    data['firebase_registration_id'] = firebaseRegistrationId;
    data['user'] = user;
    data['plaza'] = plaza;
    data['pais'] = pais;
    data['cargo'] = cargo;
    data['groups'] = groups;
    data['permisos'] = permisos;
    return data;
  }
}

class Pago {
  int? id;
  int? monto;
  String? fecha;
  String? detalles;
  int? cuotas;
  String? pagoVerificado;
  String? fotografiaComprobante;
  String? fotografiaVerificacion;
  bool? validacion;
  bool? revision;
  String? idMetodoPago;
  int? venta;
  int? voucher;
  int? recaudador;
  int? plaza;
  int? medioDePago;
  int? responsable;

  Pago(
      {this.id,
      this.monto,
      this.fecha,
      this.detalles,
      this.cuotas,
      this.pagoVerificado,
      this.fotografiaComprobante,
      this.fotografiaVerificacion,
      this.validacion,
      this.revision,
      this.idMetodoPago,
      this.venta,
      this.voucher,
      this.recaudador,
      this.plaza,
      this.medioDePago,
      this.responsable});

  Pago.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    monto = json['monto'];
    fecha = json['fecha'];
    detalles = json['detalles'];
    cuotas = json['cuotas'];
    pagoVerificado = json['pago_verificado'];
    fotografiaComprobante = json['fotografia_comprobante'];
    fotografiaVerificacion = json['fotografia_verificacion'];
    validacion = json['validacion'];
    revision = json['revision'];
    idMetodoPago = json['id_metodo_pago'];
    venta = json['venta'];
    voucher = json['voucher'];
    recaudador = json['recaudador'];
    plaza = json['plaza'];
    medioDePago = json['medio_de_pago'];
    responsable = json['responsable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['monto'] = monto;
    data['fecha'] = fecha;
    data['detalles'] = detalles;
    data['cuotas'] = cuotas;
    data['pago_verificado'] = pagoVerificado;
    data['fotografia_comprobante'] = fotografiaComprobante;
    data['fotografia_verificacion'] = fotografiaVerificacion;
    data['validacion'] = validacion;
    data['revision'] = revision;
    data['id_metodo_pago'] = idMetodoPago;
    data['venta'] = venta;
    data['voucher'] = voucher;
    data['recaudador'] = recaudador;
    data['plaza'] = plaza;
    data['medio_de_pago'] = medioDePago;
    data['responsable'] = responsable;
    return data;
  }
}
