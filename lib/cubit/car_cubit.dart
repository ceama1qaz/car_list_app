import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/car.dart';

part 'car_state.dart';

/// Cubit para gestionar el estado de la lista de coches y la búsqueda.
class CarCubit extends Cubit<CarState> {
  // Inicializa el Cubit con un estado inicial que contiene una lista de coches estáticos.
  CarCubit() : super(CarState(cars: _initialCars));
  // Lista inicial de coches.
  static final List<Car> _initialCars = [
    Car(title: 'Tesla Model S', description: 'A high-performance electric sedan with autopilot features.'),
    Car(title: 'Ford Mustang', description: 'A classic American muscle car with a powerful V8 engine.'),
    Car(title: 'Chevrolet Camaro', description: 'A stylish sports car with impressive acceleration.'),
    Car(title: 'BMW i8', description: 'A futuristic hybrid sports car with butterfly doors.'),
    Car(title: 'Audi R8', description: 'A luxury sports car with a sleek design and V10 engine.'),
  ];

  /// Método para buscar coches en la lista según un query.
  /// Si el query está vacío, se muestra la lista completa.
  /// Si no, se filtran los coches cuyo título contenga el query.
  void searchCars(String query) {
    if (query.isEmpty) {
      emit(CarState(cars: _initialCars));
    } else {
      final filteredCars = _initialCars.where((car) => car.title.toLowerCase().contains(query.toLowerCase())).toList();
      emit(CarState(cars: filteredCars));
    }
  }
}