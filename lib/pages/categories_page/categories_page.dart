import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorparts_marketplace/pages/categories_page/bloc/model_and_brand_bloc.dart';

const List<String> brandNames = [
  'Italika',
  'Vento',
  'Dinamo',
  'BMW',
];

const List<String> italikaModels = [
  'FT150',
  'FT125',
  'FT110',
  'FT90',
  'FT70',
  'FT60',
  'FT50',
  'FT40',
  'FT30',
  'FT25',
  'FT18',
  'FT16',
  'FT12',
  'FT10',
];

const List<String> ventoModels = [
  'Phantom GT5',
  'Phantom GT6',
  'Phantom GT7',
  'Phantom GT8',
  'Phantom GT9',
  'Phantom GT10',
  'Phantom GT11',
  'Phantom GT12',
  'Phantom GT13',
  'Phantom GT14',
  'Phantom GT15',
];

const List<String> dinamoModels = [
  'Rayo 150',
  'Rayo 125',
  'Rayo 110',
  'Rayo 90',
  'Rayo 70',
  'Rayo 60',
  'Rayo 50',
  'Rayo 40',
  'Rayo 30',
  'Rayo 25',
];

const List<String> bmwModels = [
  'S1000RR',
  'S1000R',
  'S1000XR',
  'R1250GS',
  'R1250GS Adventure',
  'R1250R',
];

DropdownMenuItem<String> buildMenuItem(String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}

List<DropdownMenuItem<String>> buildDropdownMenuItems(List<String> listItems) {
  List<DropdownMenuItem<String>> items = [];
  for (String listItem in listItems) {
    items.add(buildMenuItem(listItem));
  }
  return items;
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: theme.colorScheme.primary,
              ),
              title: const Text('Categorías'),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: HeaderCategories(
              modelCallback: (String? model) {
                print(model);
              },
            ),
          ),
          BlocBuilder<ModelAndBrandBloc, ModelAndBrandState>(
            builder: (context, state) {
              if (state is ModelAndBrandInitialState) {
                return SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Selecciona una marca y un modelo'),
                  ),
                );
                // return SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //     (BuildContext context, int index) {
                //       return Container(
                //         height: 100,
                //         color: Colors.amber[100 * (index % 9)],
                //         child: Center(
                //           child: Text('Item $index'),
                //         ),
                //       );
                //     },
                //     childCount: 20,
                //   ),
                // );
              } else if (state is ModelAndBrandModelSelectedState) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        color: Colors.amber[100 * (index % 9)],
                        child: Center(
                          child: Text(
                              'Item $index + ${state.model} + ${state.brand}'),
                        ),
                      );
                    },
                    childCount: 20,
                  ),
                );
              } else if (state is ModelAndBrandBrandSelectedState) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        color: Colors.amber[100 * (index % 9)],
                        child: Center(
                          child: Text(
                              'Item $index + ${state.model} + ${state.brand}'),
                        ),
                      );
                    },
                    childCount: 20,
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      color: Colors.amber[100 * (index % 9)],
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HeaderCategories extends StatefulWidget {
  const HeaderCategories({
    super.key,
    required this.modelCallback,
  });
  final ValueChanged<String?> modelCallback;

  @override
  State<HeaderCategories> createState() => _HeaderCategoriesState();
}

class _HeaderCategoriesState extends State<HeaderCategories> {
  String? selectedBrand;
  String? selectedModel;

  void _onBrandChanged(String? value) {
    setState(() {
      selectedBrand = value;
      selectedModel = null;
      widget.modelCallback.call(selectedModel);
    });
  }

  void _onModelChanged(String? value) {
    setState(() {
      selectedModel = value;
      widget.modelCallback.call(selectedModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedBrand,
                  hint: const Text('Selecciona una marca'),
                  onChanged: _onBrandChanged,
                  items: brandNames.map((String value) {
                    return buildMenuItem(value);
                  }).toList(),
                ),
              ),
              Expanded(
                child: DropdownButton<String>(
                  value: selectedModel,
                  hint: const Text('Selecciona un modelo'),
                  onChanged: _onModelChanged,
                  items: selectedBrand != null
                      ? selectedBrand == 'Italika'
                          ? buildDropdownMenuItems(italikaModels)
                          : selectedBrand == 'Vento'
                              ? buildDropdownMenuItems(ventoModels)
                              : selectedBrand == 'Dinamo'
                                  ? buildDropdownMenuItems(dinamoModels)
                                  : selectedBrand == 'BMW'
                                      ? buildDropdownMenuItems(bmwModels)
                                      : null
                      : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
