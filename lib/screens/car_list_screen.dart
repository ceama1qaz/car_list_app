import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/car_cubit.dart';
import 'car_detail_screen.dart';

/// Pantalla principal que muestra la lista de coches y un campo de búsqueda.
class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de carros'),
      ),
      body: Column(
        children: [
          // Campo de texto para buscar coches.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
                border: OutlineInputBorder(),
              ),
               // Actualiza la búsqueda en tiempo real.
              onChanged: (query) => context.read<CarCubit>().searchCars(query),
            ),
          ),
          Expanded(
            child: BlocBuilder<CarCubit, CarState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    final car = state.cars[index];
                    return ListTile(
                      title: Text(car.title),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailScreen(car: car),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}