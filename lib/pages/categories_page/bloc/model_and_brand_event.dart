part of 'model_and_brand_bloc.dart';

sealed class ModelAndBrandEvent extends Equatable {
  const ModelAndBrandEvent();

  @override
  List<Object> get props => [];
}

final class ModelAndBrandModelSelectedEvent extends ModelAndBrandEvent {
  final String model;
  const ModelAndBrandModelSelectedEvent({
    required this.model,
  });
}

final class ModelAndBrandBrandSelectedEvent extends ModelAndBrandEvent {
  final String brand;
  const ModelAndBrandBrandSelectedEvent({
    required this.brand,
  });
}

final class ModelAndBrandResetEvent extends ModelAndBrandEvent {
  const ModelAndBrandResetEvent();
}
