import 'package:flutter/material.dart';

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

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String? selectedBrand;
  String? selectedModel;

  void _onBrandChanged(String? value) {
    setState(() {
      selectedBrand = value;
      selectedModel = null;
    });
  }

  void _onModelChanged(String? value) {
    setState(() {
      selectedModel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedBrand,
              hint: const Text('Selecciona una marca'),
              onChanged: _onBrandChanged,
              items: brandNames.map((String value) {
                return buildMenuItem(value);
              }).toList(),
            ),
            DropdownButton<String>(
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
          ],
        ),
      ),
    );
  }
}
