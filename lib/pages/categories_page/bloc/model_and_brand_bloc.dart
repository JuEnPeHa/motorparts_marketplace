import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'model_and_brand_event.dart';
part 'model_and_brand_state.dart';

class ModelAndBrandBloc extends Bloc<ModelAndBrandEvent, ModelAndBrandState> {
  ModelAndBrandBloc() : super(const ModelAndBrandInitialState()) {
    on<ModelAndBrandEvent>((event, emit) {
      print('ModelAndBrandBloc: on<ModelAndBrandEvent>');
      print('ModelAndBrandBloc: event: $event');
    });
    on<ModelAndBrandModelSelectedEvent>((event, emit) {
      print('ModelAndBrandBloc: on<ModelAndBrandModelSelectedEvent>');
      print('ModelAndBrandBloc: event: $event');

      emit(ModelAndBrandModelSelectedState(
        model: event.model,
        brand: state.brand,
      ));
    });
    on<ModelAndBrandBrandSelectedEvent>((event, emit) {
      print('ModelAndBrandBloc: on<ModelAndBrandBrandSelectedEvent>');
      print('ModelAndBrandBloc: event: $event');

      emit(ModelAndBrandBrandSelectedState(
        model: state.model,
        brand: event.brand,
      ));
    });
    on<ModelAndBrandResetEvent>((event, emit) {
      print('ModelAndBrandBloc: on<ModelAndBrandResetEvent>');
      print('ModelAndBrandBloc: event: $event');

      emit(const ModelAndBrandInitialState());
    });
  }
}

class ModelAndBrandFun {
  static void modelSelected(String model, ModelAndBrandBloc bloc) {
    bloc.add(ModelAndBrandModelSelectedEvent(model: model));
  }

  static void brandSelected(String brand, ModelAndBrandBloc bloc) {
    bloc.add(ModelAndBrandBrandSelectedEvent(brand: brand));
  }

  static void reset(ModelAndBrandBloc bloc) {
    bloc.add(const ModelAndBrandResetEvent());
  }
}