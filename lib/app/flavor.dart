enum Flavor { dev, stag, production }

class FlavorValues {
  FlavorValues(
      {required this.domainApp,
      required this.authority,
      required this.baseUrl});
  final String authority;
  final String domainApp;
  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig(
      {required Flavor flavor,
      required String name,
      required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, name, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);
  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance?.flavor == Flavor.production;
  static bool isDevelopment() => _instance?.flavor == Flavor.dev;
  static bool isStaging() => _instance?.flavor == Flavor.stag;
}

void setFlavorDevelopment() {
  FlavorConfig(
      flavor: Flavor.dev,
      name: "Flavor-Dev",
      values: FlavorValues(
          domainApp: "https://softworldvietnam.com",
          authority: "dev-softworldvietnam.com",
          baseUrl: "http://localhost:3000"));
}

void setFlavorStaging() {
  FlavorConfig(
      flavor: Flavor.stag,
      name: "Flavor-Stag",
      values: FlavorValues(
          domainApp: "https://softworldvietnam.com",
          authority: "stag-softworldvietnam.com",
          baseUrl: "http://localhost:3000"));
}

void setFlavorProduction() {
  FlavorConfig(
      flavor: Flavor.production,
      name: "Flavor-Production",
      values: FlavorValues(
          domainApp: "https://softworldvietnam",
          authority: "prod-softworldvietnam.com",
          baseUrl: "http://localhost:3000"));
}
