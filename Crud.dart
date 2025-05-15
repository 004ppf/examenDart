import 'dart:io';

List<Map<String, dynamic>> productos = [];
int contadorId = 1;

void main() {
  while (true) {
    print('\n Gestion de Productos');
    print('-----------------------');
    print('1. Agregar producto');
    print('2. Actualizar producto');
    print('3. Leer productos');
    print('4. Eliminar producto');
    print('5. Salir');
    print('Seleccione una opción: ');
    int? opcion = int.tryParse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        crearProducto();
        break;
      case 2:
        actualizarProducto();
        break;
      case 3:
        leerProductos();
        break;
      case 4:
        eliminarProducto();
        break;
      case 5:
        print('Saliendo...');
        return;
      default:
        print('Opción no válida.');
    }
  }
}

void crearProducto() {
  print('\n Agregar Producto');

  print('Ingrese el nombre del producto: ');
  String? nombre = stdin.readLineSync()!;
  if (nombre.isEmpty) {
    print('Nombre no válido.');
    return;
  }
  if (productos.any((producto) => producto['nombre'] == nombre)) {
    print('El producto ya existe.');
    return;
  }

  print('Ingrese el precio del producto: ');
  double? precio = double.tryParse(stdin.readLineSync()!);
  if (precio == null) {
    print('Precio no válido.');
    return;
  }

  print('Ingrese la cantidad del producto: ');
  int? cantidad = int.tryParse(stdin.readLineSync()!);
  if (cantidad == null) {
    print('Cantidad no válida.');
    return;
  }

  Map<String, dynamic> nuevoProducto = {
    'id': contadorId,
    'nombre': nombre,
    'precio': precio,
    'cantidad': cantidad,
  };

  productos.add(nuevoProducto);
  contadorId++;
  print('Producto creado con éxito.');
}

void actualizarProducto() {
  if (productos.isEmpty) {
    print('No hay productos para actualizar.');
    return;
  }

  print('Ingrese el ID del producto a actualizar: ');
  int? id = int.tryParse(stdin.readLineSync()!);

  for (var i in productos) {
    if (i['id'] == id) {
      print('Ingrese el nuevo nombre del producto (Enter para mantener el actual):');
      String? nombre = stdin.readLineSync();
      if (nombre != null && nombre.isNotEmpty) {
        i['nombre'] = nombre;
      }

      print('Ingrese el nuevo precio del producto (Enter para mantener el actual): ');
      String? precioInput = stdin.readLineSync();
      if (precioInput != null && precioInput.isNotEmpty) {
        double? precio = double.tryParse(precioInput);
        if (precio != null) {
          i['precio'] = precio;
        } else {
          print('Precio inválido, no se actualizó.');
        }
      }

      print('Ingrese la nueva cantidad del producto (Enter para mantener el actual): ');
      String? cantidadInput = stdin.readLineSync();
      if (cantidadInput != null && cantidadInput.isNotEmpty) {
        int? cantidad = int.tryParse(cantidadInput);
        if (cantidad != null) {
          i['cantidad'] = cantidad;
        } else {
          print('Cantidad inválida, no se actualizó.');
        }
      }

      print('Producto actualizado con éxito.');
      return;
    }
  }

  print('Producto no encontrado.');
}

void eliminarProducto() {
  if (productos.isEmpty) {
    print('No hay productos para eliminar.');
    return;
  }

  print('Ingrese el ID del producto a eliminar: ');
  int? id = int.tryParse(stdin.readLineSync()!);

  for (var i in productos) {
    if (i['id'] == id) {
      productos.remove(i);
      print('✅ Producto eliminado con éxito.');
      return;
    }
  }
  print('Producto no encontrado.');
}

void leerProductos() {
  if (productos.isEmpty) {
    print('No hay productos para mostrar.');
    return;
  }

  print('\n=== Lista de Productos ===');
  for (var i in productos) {
    print('ID: ${i['id']}');
    print('Nombre: ${i['nombre']}');
    print('Precio: \$${i['precio']}');
    print('Cantidad: ${i['cantidad']}');
    print('-------------------');
  }
}
