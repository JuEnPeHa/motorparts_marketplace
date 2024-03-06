import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorparts_marketplace/pages/categories_page/bloc/model_and_brand_bloc.dart';

class ModelAndBrandBlocFunctions {
  void chooseModel(String model, BuildContext context) {
    final bloc = BlocProvider.of<ModelAndBrandBloc>(context);
    bloc.add(ModelAndBrandModelSelectedEvent(model: model));
  }

  void chooseBrand(String brand, BuildContext context) {
    final bloc = BlocProvider.of<ModelAndBrandBloc>(context);
    bloc.add(ModelAndBrandBrandSelectedEvent(brand: brand));
  }

  void reset(BuildContext context) {
    final bloc = BlocProvider.of<ModelAndBrandBloc>(context);
    bloc.add(ModelAndBrandResetEvent());
  }
}
