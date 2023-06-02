import 'package:flutter/foundation.dart';
import 'package:grupo_empresarial_r/models/item.dart'; // Reemplaza 'my_app' con el nombre de tu paquete

class ItemsProvider extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }
}
