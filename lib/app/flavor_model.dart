
enum Flavor { BUSINESS, CLIENT }

class FlavorModel {
  final Flavor flavor;
  final bool isRelease;

  FlavorModel({required this.flavor, required this.isRelease});

  @override
  bool operator ==(Object other) {
    return other is FlavorModel &&
        flavor == other.flavor &&
        isRelease == other.isRelease;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    return 'VariantModel{flavor: $flavor, isRelease: $isRelease';
  }
}
