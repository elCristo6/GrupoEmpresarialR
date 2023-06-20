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
      throw Exception('Error de conexión o de la API');
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
            createdAt: factura['createdAt'],
            updatedAt: factura['updatedAt']);
      }).toList();

      return remisiones;
    } else {
      throw Exception('Failed to load remission');
    }
  }
}
