import '../models/difficulty.dart';

class DifficultySettings {
  final int damageDecrease;
  final int speedDecrease;
  final int damageInflicted;
  final double experienceCoefficient;

  const DifficultySettings(this.damageDecrease, this.speedDecrease,
      this.damageInflicted, this.experienceCoefficient);
}

const difficultyDatabase = {
  Difficulty.practice: DifficultySettings(0, 0, 150, 246.5),
  Difficulty.veryEasy: DifficultySettings(0, 0, 130, 278.5),
  Difficulty.easy: DifficultySettings(0, 0, 115, 309.5),
  Difficulty.normal: DifficultySettings(0, 0, 100, 355.5),
  Difficulty.hard: DifficultySettings(0, 0, 85, 402),
  Difficulty.veryHard: DifficultySettings(0, 0, 70, 448.5),
  Difficulty.hell: DifficultySettings(0, 0, 60, 494.4),
  Difficulty.inferno: DifficultySettings(0, 0, 50, 541.6),
  Difficulty.lunatic: DifficultySettings(5, 0, 40, 603),
  Difficulty.holic: DifficultySettings(10, 0, 35, 664.15),
  Difficulty.epic: DifficultySettings(15, 5, 30, 726.5),
  Difficulty.ultimate: DifficultySettings(20, 10, 25, 789),
  Difficulty.impossible: DifficultySettings(30, 20, 20, 865.5),
  Difficulty.theFinal: DifficultySettings(50, 30, 15, 942.4),
  Difficulty.hallOfFame: DifficultySettings(100, 50, 10, 1134.4),
  Difficulty.towerOfChallenge: DifficultySettings(0, 0, 2, 0),
};

const tormentDatabase = [
  0,
  10,
  20,
  30,
  40,
  50,
  60,
  70,
  80,
  90,
  92,
  94,
  95.5,
  97,
];
