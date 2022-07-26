enum WeightType {
  pound,
  kilogram,
}

extension WeightTypeExtension on WeightType {
  String get name {
    switch (this) {
      case WeightType.kilogram:
        return 'kg';
      case WeightType.pound:
        return 'lb';
    }
  }
}
