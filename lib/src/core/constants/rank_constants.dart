import '../models/rank.dart';

const RXD_SPEED = 1.5;
const SXD_SPEED = 1.25;

const DAMAGE_LOOKUP = {
  Rank.D: -10,
  Rank.C: -5,
  Rank.B: 0,
  Rank.A: 5,
  Rank.S: 10,
  Rank.SS: 20,
  Rank.SSS: 30,
  Rank.X: 40,
  Rank.XD: 50,
  Rank.SXD: 50,
  Rank.RXD: 100,
};

const LIMIT_BREAK_DAMAGE_LOOKUP = [
  0,
  50,
  100,
  175,
  300,
  500,
];

const LIMIT_BREAK_ACCELERATION_LOOKUP = [
  0,
  0,
  0,
  10,
  20,
  30,
];
