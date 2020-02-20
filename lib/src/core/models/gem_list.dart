import '../constants/environment_constants.dart';
import 'stats.dart';

enum Gem {
  EasyRank,
  Donation,
  Helper,
  OverUpgrade,
  GasBank,
  DoubleCard,
  HorseMaster,
  Starter,
  Silence,
  AP,
  PowerBanker,
  AirBus,
  Sxd,
  Slow,
  MultiRaptor,
  Party,
  Meteor,
  Artifact,
  Sheriff,
  Starforce,
  BlackHole,
  ShieldOff,
  LimitDestroy,
  EasyRankPlus,
  OverUpgradePlus,
  GasBankPlus,
  DoubleCardPlus,
  HorseMasterPlus,
  HelperPlus,
  MultiRaptorPlus,
  SxdPlus,
  AlphaSoloCrit,
  Stimpack,
  GasReturn,
  ShieldMaster,
}

class GemList {
  List<Gem> selectedGems = [];

  Stats calcStats(int experience) {
    var stats = Stats.empty();

    // Starter gem.
    num starterGemBonus = (hasStarter()) ? STARTER_GEM_STATS : 0;
    if (experience < STARTER_GEM_EXPERIENCE) {
      starterGemBonus *= STARTER_GEM_MULTIPLIER;
    }

    // Power banker gem.
    num powerBankerGemBonus = (hasPowerBanker()) ? POWER_BANKER_GEM_STATS : 0;

    stats.attackDamage = starterGemBonus + powerBankerGemBonus;
    stats.attackSpeed = starterGemBonus;

    return stats;
  }

  bool hasPowerBanker() {
    return selectedGems.contains(Gem.PowerBanker);
  }

  bool hasStarter() {
    return selectedGems.contains(Gem.Starter);
  }
}
