import 'specialty_data.dart';
import 'stats.dart';
import 'title.dart';

import 'dart:math';

class Specialty {
  final SpecialtyData data;
  int pointsBought = 0;

  Specialty(this.data);

  num nextPointCost() {
    // This doesn't account for >150 points bought for The One specialties in Korea.
    if (pointsBought == data.maxPoints) {
      return double.infinity;
    } else if (pointsBought > data.maxPoints) {
      throw Exception('Points bought > Max points');
    } else if (isMultiCrit()) {
      // Handle custom multi-crit formula.
      return nextPointCostMultiCrit();
    } else {
      return data.startingCost + pointsBought * data.costIncrease;
    }
  }

  num cumulativePointCost() {
    // This doesn't account for >150 points bought for The One specialties in Korea.
    if (pointsBought > data.maxPoints) {
      throw Exception('Points bought > Max points');
    } else if (isMultiCrit()) {
      return cumulativePointCostMultiCrit();
    } else {
      var a = data.startingCost;
      var d = data.costIncrease;
      var n = pointsBought;
      return (n * (2 * a + (n - 1) * d)) / 2;
      // Sum from 1 to n-1. The first buy won't contain the next-point-cost value, thus n-1 instead of n.
      var s = n * (n - 1) / 2;
      return n * a + d * s;
    }
  }

  bool isMultiCrit() {
    return data.statTypes.isNotEmpty &&
        data.statTypes.every((t) => t == StatType.MultiCrit);
  }

  int nextPointCostMultiCrit() {
    switch (data.requiredTitle) {
      case Title.Expert:
        if (pointsBought < 8) {
          return 350 * pow(2, pointsBought);
        } else if (pointsBought < 20) {
          return 50000;
        } else {
          return 100000;
        }
        break;
      case Title.TheOne2:
        if (pointsBought < 5) {
          return 75000;
        } else if (pointsBought < 10) {
          return 225000;
        } else {
          return 675000;
        }
        break;
      default:
        throw UnimplementedError(
            'Multi Crit is not yet implemented for this title');
    }
  }

  int cumulativePointCostMultiCrit() {
    switch (data.requiredTitle) {
      case Title.Expert:
        if (pointsBought <= 8) {
          return 350 * (pow(2, pointsBought) - 1);
        } else if (pointsBought <= 20) {
          return 350 * (pow(2, 7) - 1) + 50000 * (pointsBought - 7);
        } else {
          return 350 * (pow(2, 7) - 1) +
              50000 * (20 - 7) +
              100000 * (pointsBought - 20);
        }
        break;
      case Title.TheOne2:
        if (pointsBought <= 5) {
          return 75000 * pointsBought;
        } else if (pointsBought <= 10) {
          return 75000 * 5 + 225000 * (pointsBought - 5);
        } else {
          return 75000 * 5 + 225000 * (10 - 5) + 675000 * (pointsBought - 10);
        }
        break;
      default:
        throw UnimplementedError(
            'Multi Crit is not yet implemented for this title');
    }
  }
}
