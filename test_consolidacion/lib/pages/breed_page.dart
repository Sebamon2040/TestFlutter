import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/breeds/breed_bloc.dart';
import 'package:draggable_widget/draggable_widget.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breeds')),
      body: BlocBuilder<BreedBloc, BreedState>(
        builder: (context, state) {
          if (state is BreedLoaded) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: DataTable(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      columns: <DataColumn>[
                        DataColumn(
                            label: SizedBox(
                                width: (constraints.maxWidth - 40) / 2,
                                child: const Text('Name'))),
                        DataColumn(
                            label: SizedBox(
                                width: (constraints.maxWidth - 40) / 2,
                                child: const Text('More Information'))),
                      ],
                      rows: state.breeds.map((breed) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(SizedBox(
                                width: (constraints.maxWidth - 40) / 2,
                                child:
                                    Text(breed.attributes?.name ?? 'No name'))),
                            DataCell(
                              SizedBox(
                                width: (constraints.maxWidth - 40) / 2,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('More Information'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                    'ID: ${breed.id ?? 'No ID'}'),
                                                Text(
                                                    'Name: ${breed.attributes?.name ?? 'No name'}'),
                                                Text(
                                                    'Description: ${breed.attributes?.description ?? 'No description'}'),
                                                Text(
                                                    'Hypoallergenic: ${breed.attributes?.hypoallergenic?.toString() ?? 'Unknown'}'),
                                                Text(
                                                    'Life Expentancy: Between ${breed.attributes?.life?.min ?? 'Unknown'} and ${breed.attributes?.life?.max ?? 'Unknown'} years'),
                                                Text(
                                                    'Male Weight: Between ${breed.attributes?.maleWeight?.min ?? 'Unknown'} and ${breed.attributes?.maleWeight?.max ?? 'Unknown'} kgs'),
                                                Text(
                                                    'Female Weight: Between ${breed.attributes?.femaleWeight?.min ?? 'Unknown'} and ${breed.attributes?.femaleWeight?.max ?? 'Unknown'} kgs'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Close'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('View More'),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              int previousPage = context.read<BreedBloc>().currentPage - 1;
              context
                  .read<BreedBloc>()
                  .add(FetchBreeds(page: previousPage >= 1 ? previousPage : 1));
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<BreedBloc>().add(
                  FetchBreeds(page: context.read<BreedBloc>().currentPage + 1));
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
