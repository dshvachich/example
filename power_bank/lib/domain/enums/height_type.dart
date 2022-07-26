enum HeightType {
  foot,
  centimeter,
}

extension HeightTypeExtension on HeightType {
  String get name {
    switch (this) {
      case HeightType.foot:
        return 'ft';
      case HeightType.centimeter:
        return 'cm';
    }
  }
}
