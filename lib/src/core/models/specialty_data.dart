import 'stats.dart';
import 'title.dart';

class SpecialtyData {
  final String name;
  final num maxPoints;
  final num multiplier;
  final num startingCost;
  final num costIncrease;
  final Title requiredTitle;
  final List<StatType> statTypes;

  const SpecialtyData(this.requiredTitle, this.name, this.multiplier,
      this.startingCost, this.costIncrease, this.maxPoints, this.statTypes);
}
