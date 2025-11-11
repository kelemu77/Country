import 'package:intl/intl.dart';

class Formatters {
  static String formatPopulation(int population) {
    if (population >= 1000000000) {
      return '${(population / 1000000000).toStringAsFixed(1)}B';
    } else if (population >= 1000000) {
      return '${(population / 1000000).toStringAsFixed(1)}M';
    } else if (population >= 1000) {
      return '${(population / 1000).toStringAsFixed(1)}K';
    }
    return population.toString();
  }

  static String formatArea(double? area) {
    if (area == null) return 'N/A';
    final formatter = NumberFormat('#,###');
    return '${formatter.format(area)} sq km';
  }

  static String formatPopulationDetailed(int population) {
    if (population >= 1000000000) {
      return '${(population / 1000000000).toStringAsFixed(2)} billion';
    } else if (population >= 1000000) {
      return '${(population / 1000000).toStringAsFixed(2)} million';
    } else if (population >= 1000) {
      return '${(population / 1000).toStringAsFixed(2)} thousand';
    }
    return population.toString();
  }
}
