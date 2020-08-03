import 'package:lotto_defence_tools/core.dart';

void cultSetup(Optimizer op) {
  op.env.difficulty = Difficulty.theFinal;

  op.env.dt = true;
  op.env.haveArtifact = true;
  op.env.flowerAttackDamage = true;
  op.env.flowerAttackSpeed = true;
  op.env.flowerDamageTaken = true;
  op.env.selfBless = true;
  op.env.targetRound = 115; // 71 is max
  // op.env.haveXelnagaKerrigan = true;
  // op.env.haveTerraTron = true;
  // op.env.haveAmon = true;
  // op.env.haveSpearOfAdun = true;
  // op.env.haveSpecOps = true;
  op.env.unitLevel = 11;
  op.env.unitRank = Rank.S;
  const numPlayers = 2;
  op.env.teamAttackDamage = 27 * numPlayers;
  op.env.teamAttackSpeed = 27 * numPlayers;
  op.env.teamCritChance = 13.5 * numPlayers;
  op.env.teamBless = 20 * numPlayers;
  op.env.helpful = true;
  // op.env.useAverageUpgrade = true;

  op.env.torments = 7;

  // Beginner
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'MS 1')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Attack Range 1')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bonus Minerals')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bonus Lives')
      .pointsBought = 10;

  // Amateur
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Revisions')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit EXP bonus')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Interest rate bonus')
      .pointsBought = 10;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Maximum Hero Upgrades')
  //     .pointsBought = 10;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Sell Lotto')
  //     .pointsBought = 15;

  // Professional
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Basic Rank')
      .pointsBought = 4;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Upgrade Revision')
  //     .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Upgrade Fail Revision')
  //     .pointsBought = 3;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rank Revision 1')
  //     .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Gold Card Revision')
  //     .pointsBought = 5;

  // Expert
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'MS 2')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit Lottery')
      .pointsBought = 40;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Gas Lottery')
  //     .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bank Lotto')
      .pointsBought = 40;

  // Master
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Attack Range 2')
      .pointsBought = 1;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Lottery Revision')
      .pointsBought = 15;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Cooldown reduction')
      .pointsBought = 20;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Mineral Kill Lotto')
      .pointsBought = 20;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Kill Lotto')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'XP Lotto')
      .pointsBought = 50;

  // Divine
  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'SP Bank')
  //     .pointsBought = 118;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Kill XP 1')
      .pointsBought = 60;

  // The One
  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Double upgrade lotto')
  //     .pointsBought = 50;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rank Revision 2')
  //     .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'SXD Revision')
  //     .pointsBought = 6;

  // The One 2
  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rune Enchant Chance')
  //     .pointsBought = 20;
}

void exSetup(Optimizer op) {
  op.env.difficulty = Difficulty.easy;

  op.env.dt = true;
  op.env.haveArtifact = true;
  op.env.flowerAttackDamage = true;
  op.env.flowerAttackSpeed = true;
  op.env.flowerDamageTaken = true;
  op.env.selfBless = true;
  op.env.targetRound = 251; // 71 is max
  op.env.haveXelnagaKerrigan = true;
  op.env.haveTerraTron = true;
  op.env.haveAmon = true;
  // op.env.haveSpearOfAdun = true;
  // op.env.haveSpecOps = true;
  op.env.unitLevel = 11;
  op.env.unitRank = Rank.X;
  const numPlayers = 0;
  op.env.teamAttackDamage = 27 * numPlayers;
  op.env.teamAttackSpeed = 27 * numPlayers;
  op.env.teamCritChance = 13.5 * numPlayers;
  op.env.teamBless = 20 * numPlayers;
  // op.env.helpful = true;

  op.env.torments = 7;

  // Beginner
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'MS 1')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Attack Range 1')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bonus Minerals')
      .pointsBought = 4;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Bonus Lives')
  //     .pointsBought = 10;

  // Amateur
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Revisions')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit EXP bonus')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Interest rate bonus')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Maximum Hero Upgrades')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Sell Lotto')
      .pointsBought = 15;

  // Professional
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Basic Rank')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Upgrade Revision')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Upgrade Fail Revision')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Rank Revision 1')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gold Card Revision')
      .pointsBought = 5;

  // Expert
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'MS 2')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit Lottery')
      .pointsBought = 70;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Gas Lottery')
  //     .pointsBought = 70;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bank Lotto')
      .pointsBought = 70;

  // Master
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Attack Range 2')
      .pointsBought = 1;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Lottery Revision')
      .pointsBought = 15;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Cooldown reduction')
      .pointsBought = 20;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Mineral Kill Lotto')
      .pointsBought = 70;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Kill Lotto')
      .pointsBought = 60;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'XP Lotto')
  //     .pointsBought = 50;

  // Divine
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'SP Bank')
      .pointsBought = 132;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Kill XP 1')
  //     .pointsBought = 20;

  // The One
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Double upgrade lotto')
      .pointsBought = 50;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Rank Revision 2')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'SXD Revision')
      .pointsBought = 10;

  // The One 2
  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rune Enchant Chance')
  //     .pointsBought = 20;
}

void afkSetup(Optimizer op) {
  op.env.difficulty = Difficulty.inferno;

  op.env.dt = true;
  op.env.haveArtifact = true;
  op.env.flowerAttackDamage = true;
  op.env.flowerAttackSpeed = true;
  op.env.flowerDamageTaken = true;
  op.env.selfBless = true;
  op.env.targetRound = 191; // 71 is max
  op.env.haveXelnagaKerrigan = true;
  // op.env.haveTerraTron = true;
  // op.env.haveAmon = true;
  // op.env.haveSpearOfAdun = true;
  // op.env.haveSpecOps = true;
  op.env.unitLevel = 11;
  op.env.unitRank = Rank.X;
  const numPlayers = 2;
  op.env.teamAttackDamage = 27 * numPlayers;
  op.env.teamAttackSpeed = 27 * numPlayers;
  op.env.teamCritChance = 13.5 * numPlayers;
  op.env.teamBless = 20 * numPlayers;
  // op.env.helpful = true;

  // op.env.torments = 7;

  // Beginner
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'MS 1')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Attack Range 1')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bonus Minerals')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bonus Lives')
      .pointsBought = 10;

  // Amateur
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Revisions')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit EXP bonus')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Interest rate bonus')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Maximum Hero Upgrades')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Sell Lotto')
      .pointsBought = 15;

  // Professional
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Basic Rank')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Upgrade Revision')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Upgrade Fail Revision')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Rank Revision 1')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gold Card Revision')
      .pointsBought = 5;

  // Expert
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'MS 2')
      .pointsBought = 3;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit Lottery')
      .pointsBought = 70;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Lottery')
      .pointsBought = 70;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bank Lotto')
      .pointsBought = 50;

  // Master
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Attack Range 2')
      .pointsBought = 1;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Lottery Revision')
      .pointsBought = 15;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Cooldown reduction')
      .pointsBought = 20;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Mineral Kill Lotto')
      .pointsBought = 20;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Gas Kill Lotto')
      .pointsBought = 30;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'XP Lotto')
  //     .pointsBought = 50;

  // Divine
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'SP Bank')
      .pointsBought = 31;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Kill XP 1')
  //     .pointsBought = 20;

  // The One
  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Double upgrade lotto')
      .pointsBought = 35;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Rank Revision 2')
      .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'SXD Revision')
      .pointsBought = 10;

  // The One 2
  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rune Enchant Chance')
  //     .pointsBought = 20;
}

void main() {
  var op = Optimizer();

  op.profile.title = Title.TheOne2;
  op.profile.xp = 1624388;

  op.profile.selectedRune.baseStats.setStat(StatType.AttackDamage, 14);
  op.profile.selectedRune.baseStats.setStat(StatType.AttackSpeed, 12);
  op.profile.selectedRune.baseStats.setStat(StatType.CritChance, 15);
  op.profile.selectedRune.baseStats.setStat(StatType.CritDamage, 42);
  op.profile.selectedRune.sp = 15;
  op.profile.selectedRune.enchantLevel = 15;
  op.profile.selectedRune.options.add(RuneOptions.BaseCrit);
  op.profile.selectedRune.options.add(RuneOptions.Acceleration);

  exSetup(op);
  // cultSetup(op);
  // afkSetup(op);

  op.optimizeSp();

  op.selectedSpecialties.allSpecialties
      .where((sp) => sp.data.statTypes.isNotEmpty && sp.pointsBought > 0)
      .forEach((sp) =>
          {print('${sp.data.name}: ${sp.pointsBought}/${sp.data.maxPoints}')});
}
