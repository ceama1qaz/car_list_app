part of 'car_cubit.dart';

/// Estado que contiene la lista de coches. 
/// Utiliza Equatable para facilitar la comparación de estados.
class CarState extends Equatable {
  final List<Car> cars;

  const CarState({required this.cars});

  @override
  List<Object> get props => [cars];
}