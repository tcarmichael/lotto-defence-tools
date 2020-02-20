import 'package:lotto_defence_tools/core.dart';

void main() {
  var op = Optimizer();

  op.profile.title = Title.TheOne2;
  op.profile.xp = 312873 + 583333; // 700000 SP from donations

  op.profile.rune.baseStats.setStat(StatType.AttackDamage, 15);
  op.profile.rune.baseStats.setStat(StatType.AttackSpeed, 13);
  op.profile.rune.baseStats.setStat(StatType.CritChance, 12);
  // op.profile.rune.baseStats.setStat(StatType.CritDamage, 42);
  op.profile.rune.sp = 10;
  op.profile.rune.enchantLevel = 9;
  // op.profile.rune.options.add(RuneOptions.BaseCrit);

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'SP Bank')
  //     .pointsBought = 60;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bonus Minerals')
      .pointsBought = 4;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Bank Lotto')
      .pointsBought = 10;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Gas Lottery')
  //     .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Mineral Kill Lotto')
      .pointsBought = 10;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Gas Kill Lotto')
  //     .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Basic Rank')
      .pointsBought = 4;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Kill XP 1')
  //     .pointsBought = 20;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'XP Lotto')
  //     .pointsBought = 50;

// op.selectedSpecialties.allSpecialties
//     .firstWhere((sp) => sp.data.name == 'Gold Card Revision')
//     .pointsBought = 5;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Unit Lottery')
      .pointsBought = 10;

  op.selectedSpecialties.allSpecialties
      .firstWhere((sp) => sp.data.name == 'Lottery Revision')
      .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Maximum Hero Upgrades')
  //     .pointsBought = 10;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Sell Lotto')
  //     .pointsBought = 20;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Upgrade Revision')
  //     .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Upgrade Fail Revision')
  //     .pointsBought = 3;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rune Enchant Chance')
  //     .pointsBought = 20;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rank Revision 1')
  //     .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'Rank Revision 2')
  //     .pointsBought = 5;

  // op.selectedSpecialties.allSpecialties
  //     .firstWhere((sp) => sp.data.name == 'SXD Revision')
  //     .pointsBought = 10;

  op.env.difficulty = Difficulty.inferno;
  op.env.dt = true;
  op.env.haveArtifact = false;
  op.env.flowerAttackDamage = false;
  op.env.flowerAttackSpeed = false;
  op.env.flowerDamageTaken = false;
  op.env.selfBless = true;
  op.env.targetRound = 115;
  op.env.haveXelnagaKerrigan = false;
// op.env.haveTerraTron = true;
  op.env.haveAmon = false;
// op.env.haveSpearOfAdun = true;
// op.env.haveSpecOps = true;
  op.env.unitLevel = 0;
  op.env.unitRank = Rank.S;
  op.env.teamAttackDamage = 54;
  op.env.teamAttackSpeed = 54;
  op.env.teamCritChance = 27;
  op.env.teamBless = 40;
  op.env.helpful = true;

  op.optimizeSp();

  op.selectedSpecialties.allSpecialties
      .where((sp) => sp.data.statTypes.isNotEmpty && sp.pointsBought > 0)
      .forEach((sp) =>
          {print('${sp.data.name}: ${sp.pointsBought}/${sp.data.maxPoints}')});
}
