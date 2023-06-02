import 'package:grupo_empresarial_r/models/articulos.dart';
import 'package:flutter/foundation.dart';

class RemisionesProvider extends ChangeNotifier {
  final List<Articulo> _remisiones = [];

  List<Articulo> get remisiones => _remisiones;

  void add(Articulo remision) {
    _remisiones.add(remision);
    notifyListeners();
  }
}
