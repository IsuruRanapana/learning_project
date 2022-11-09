enum Flavor {
  DEV,
  QA,
  UAT,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Dev App';
      case Flavor.QA:
        return 'QA App';
      case Flavor.UAT:
        return 'UAT App';
      case Flavor.PROD:
        return 'Production App';
      default:
        return 'title';
    }
  }

}
