import 'dart:math';

import '../models/difficulty.dart';

int getArmor(int round, Difficulty difficulty) {
  return (difficulty == Difficulty.towerOfChallenge)
      ? getArmorTocInternal(round)
      : getArmorInternal(round);
}

int getArmorInternal(int round) {
  var armor = 0;
  if (round >= 160) {
    armor += min(round - 160 + 1, 180 - 160) * 4;
  }
  if (round >= 180) {
    armor += min(round - 180 + 1, 200 - 180) * 8;
  }
  if (round >= 200) {
    armor += min(round - 200 + 1, 220 - 200) * 12;
  }
  if (round >= 220) {
    armor += min(round - 220 + 1, 240 - 220) * 15;
  }
  if (round >= 240) {
    armor += min(round - 240 + 1, 260 - 240) * 23;
  }
  if (round >= 260) {
    armor += (round - 260 + 1) * 30;
  }
  return armor;
}

int getArmorTocInternal(int round) {
  var armor = 0;
  if (round >= 0) {
    // Note the -2 at the end to handle how the armor values start off.
    armor += min(round + 1, 10 - 0) * 1 - 2;
  }
  if (round >= 10) {
    armor += min(round - 10 + 1, 20 - 10) * 2;
  }
  if (round >= 20) {
    armor += min(round - 20 + 1, 30 - 20) * 5;
  }
  if (round >= 30) {
    armor += min(round - 30 + 1, 40 - 30) * 15;
  }
  if (round >= 40) {
    armor += min(round - 40 + 1, 50 - 40) * 50;
  }
  if (round >= 50) {
    armor += min(round - 50 + 1, 60 - 50) * 80;
  }
  if (round >= 60) {
    armor += (round - 60 + 1) * 100;
  }
  return armor;
}
