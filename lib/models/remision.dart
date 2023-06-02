import '../models/usercc.dart';
import '../models/articulos.dart';

class Remision {
  final String ciudad;
  final String transportador;
  final String ccTransportador;
  final String direccion;
  final String placa;
  final String despachado;
  final String recibido;
  final double totalPeso;
  final String empresa;
  final UserCC userCC;
  final List<Articulo> articulos;

  Remision({
    required this.ciudad,
    required this.transportador,
    required this.ccTransportador,
    required this.direccion,
    required this.placa,
    required this.despachado,
    required this.recibido,
    required this.totalPeso,
    required this.empresa,
    required this.userCC,
    required this.articulos,
  });

  Map<String, dynamic> toJson() => {
        'ciudad': ciudad,
        'transportador': transportador,
        'ccTransportador': ccTransportador,
        'direccion': direccion,
        'placa': placa,
        'despachado': despachado,
        'recibido': recibido,
        'totalPeso': totalPeso,
        'empresa': empresa,
        'userCC': userCC.toJson(),
        'articulos': articulos.map((articulo) => articulo.toJson()).toList(),
      };

  factory Remision.fromJson(Map<String, dynamic> json) => Remision(
        ciudad: json['ciudad'],
        transportador: json['transportador'],
        ccTransportador: json['ccTransportador'],
        direccion: json['direccion'],
        placa: json['placa'],
        despachado: json['despachado'],
        recibido: json['recibido'],
        totalPeso: json['totalPeso'],
        empresa: json['empresa'],
        userCC: UserCC.fromJson(json['userCC']),
        articulos: (json['articulos'] as List)
            .map((i) => Articulo.fromJson(i))
            .toList(),
      );
}
