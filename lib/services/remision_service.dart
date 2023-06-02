import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/remision.dart';

class DeliveryController {
  // URL de tu API
  final String url = 'http://api.miservidor.com/delivery';

  // Método para enviar la información al servidor
  Future<bool> sendDelivery(Remision delivery) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(delivery.toJson()),
      );

      // Aquí puedes verificar la respuesta del servidor y retornar un valor de éxito o fracaso.
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
