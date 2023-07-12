import 'dart:convert';

import '../models/articulos.dart';
import '../models/remision.dart';
import '../models/usercc.dart';
import '../services/api.dart';

class RemisionService {
  static const String _endpoint = 'newRemission/';

  Future<Remision> crearRemision(Remision remision) async {
    try {
      final response = await API.post(_endpoint, remision.toJson());

      if (response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        return Remision.fromJson(jsonData);
      } else {
        throw Exception('Error al crear la remisión');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// Este método acepta el ID de la remisión como parámetro
  Future<List<Remision>> getRemisiones(int cc) async {
    final response = await API.get('$_endpoint$cc/');
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);

      final List<Remision> remisiones =
          (decodedResponse['facturas'] as List).map((factura) {
        final List<Articulo> articulos =
            (factura['detailsNewRemissions'] as List).map((articulo) {
          return Articulo.fromJson(articulo);
        }).toList();

        return Remision(
            id: factura['id'],
            ciudad: factura['ciudad'],
            transportador: factura['transportador'],
            ccTransportador: factura['ccTransportador'],
            direccion: factura['direccion'],
            placa: factura['placa'],
            despachado: factura['despachado'],
            recibido: factura['recibido'],
            totalPeso: double.parse(factura['totalPeso']),
            empresa: factura['empresa'],
            userCC: UserCC.fromJson(factura['userCC']
                as String), // Aquí cambiamos UserCC para que acepte un String
            articulos: articulos,
            createdAt: DateTime.parse(factura['createdAt']),
            updatedAt: DateTime.parse(factura['updatedAt']));
      }).toList();

      return remisiones;
    } else {
      throw Exception('Failed to load remission');
    }
  }

  Future<List<Remision>> getTodasLasRemisiones() async {
    final response = await API.get('$_endpoint');

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = json.decode(response.body);

      final List<Remision> remisiones = decodedResponse.map((factura) {
        // Use an empty list if detailsNewRemissions is null
        final List<dynamic> detailsNewRemissions =
            factura['detailsNewRemissions'] ?? [];

        final List<Articulo> articulos = detailsNewRemissions.map((articulo) {
          return Articulo.fromJson(articulo);
        }).toList();

        return Remision(
            id: factura['id'],
            ciudad: factura['ciudad'],
            transportador: factura['transportador'],
            ccTransportador: factura['ccTransportador'],
            direccion: factura['direccion'],
            placa: factura['placa'],
            despachado: factura['despachado'],
            recibido: factura['recibido'],
            totalPeso: double.parse(factura['totalPeso']),
            empresa: factura['empresa'],
            userCC: UserCC.fromJson(factura['userCC']),
            articulos: articulos,
            createdAt: DateTime.parse(factura['createdAt']),
            updatedAt: DateTime.parse(factura['updatedAt']));
      }).toList();

      return remisiones;
    } else {
      throw Exception('Failed to load remissions');
    }
  }
}
