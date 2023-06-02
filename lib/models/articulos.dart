class Articulo {
  final String material;
  final int cantidad;
  final String descripcion;

  Articulo({
    required this.material,
    required this.cantidad,
    required this.descripcion,
  });

  Map<String, dynamic> toJson() => {
        'material': material,
        'cantidad': cantidad,
        'descripcion': descripcion,
      };

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        material: json['material'],
        cantidad: json['cantidad'],
        descripcion: json['descripcion'],
      );
}
