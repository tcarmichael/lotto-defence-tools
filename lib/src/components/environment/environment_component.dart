import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:lotto_defence_tools/src/core/models/environment.dart';

import '../../../core.dart';

@Component(
  selector: 'environment',
  styleUrls: ['environment_component.css'],
  templateUrl: 'environment_component.html',
  directives: [
    materialInputDirectives,
    materialNumberInputDirectives,
    DropdownSelectValueAccessor,
    DropdownButtonComponent,
    MaterialButtonComponent,
    MaterialDropdownSelectComponent,
    MaterialIconComponent,
    MaterialSelectDropdownItemComponent,
    MaterialToggleComponent,
    NgIf,
    NgFor,
  ],
  providers: [materialProviders],
  exports: [Difficulty, Rank],
)
class EnvironmentComponent {
  static const Map<Difficulty, String> _prettyDifficultyNames = {
    Difficulty.practice: 'Practice',
    Difficulty.veryEasy: 'Very Easy',
    Difficulty.easy: 'Easy',
    Difficulty.normal: 'Normal',
    Difficulty.hard: 'Hard',
    Difficulty.veryHard: 'Very Hard',
    Difficulty.hell: 'Hell',
    Difficulty.inferno: 'Inferno',
    Difficulty.lunatic: 'Lunatic',
    Difficulty.holic: 'Holic',
    Difficulty.epic: 'Epic',
    Difficulty.ultimate: 'Ultimate',
    Difficulty.impossible: 'Impossible',
    Difficulty.theFinal: 'The Final',
    Difficulty.hallOfFame: 'Hall of Fame',
    Difficulty.towerOfChallenge: 'Tower of Challenge',
  };

  static const Map<Rank, String> _prettyRankNames = {
    Rank.D: 'D',
    Rank.C: 'C',
    Rank.B: 'B',
    Rank.A: 'A',
    Rank.S: 'S',
    Rank.SS: 'SS',
    Rank.SSS: 'SSS',
    Rank.X: 'X',
    Rank.XD: 'XD',
    Rank.SXD: 'SXD',
    Rank.RXD: 'RXD',
  };

  @Input()
  Environment env;

  ItemRenderer difficultyRenderer =
    (d) => _prettyDifficultyNames[d];
  ItemRenderer rankRenderer =
    (r) => _prettyRankNames[r];

  void maxTeamBuffs() {
    env.teamAttackDamage = 54;
    env.teamAttackSpeed = 54;
    env.teamCritChance = 27;
    if (env.selfBless) {
      env.teamBless = 40;
    }
  }
}
