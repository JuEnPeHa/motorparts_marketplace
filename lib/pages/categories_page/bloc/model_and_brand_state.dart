part of 'model_and_brand_bloc.dart';

sealed class ModelAndBrandState extends Equatable {
  final String model;
  final String brand;
  const ModelAndBrandState({
    required this.model,
    required this.brand,
  });

  @override
  List<Object> get props => [
        model,
        brand,
      ];
}

final class ModelAndBrandInitialState extends ModelAndBrandState {
  const ModelAndBrandInitialState() : super(model: '', brand: '');
}

final class ModelAndBrandModelSelectedState extends ModelAndBrandState {
  const ModelAndBrandModelSelectedState({
    required super.model,
    required super.brand,
  });
}

final class ModelAndBrandBrandSelectedState extends ModelAndBrandState {
  const ModelAndBrandBrandSelectedState({
    required super.model,
    required super.brand,
  });
}
