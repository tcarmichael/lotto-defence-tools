import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:lotto_defence_tools/src/core/models/environment.dart';
import 'package:lotto_defence_tools/src/services/environment_service.dart';

import '../../../core.dart';

EnvironmentService environmentServiceFactory() => EnvironmentService(window.localStorage);

@Component(
  selector: 'environment',
  styleUrls: ['environment_component.css'],
  templateUrl: 'environment_component.html',
  directives: [
    materialInputDirectives,
    materialNumberInputDirectives,
    AutoFocusDirective,
    DropdownSelectValueAccessor,
    DropdownButtonComponent,
    MaterialButtonComponent,
    MaterialDialogComponent,
    MaterialDropdownSelectComponent,
    MaterialIconComponent,
    MaterialSaveCancelButtonsDirective,
    MaterialSelectDropdownItemComponent,
    MaterialSelectComponent,
    MaterialSelectItemComponent,
    MaterialToggleComponent,
    MaterialYesNoButtonsComponent,
    ModalComponent,
    NgIf,
    NgFor,
  ],
  providers: [FactoryProvider(EnvironmentService, environmentServiceFactory), materialProviders],
  exports: [Difficulty, Rank],
)
class EnvironmentComponent implements OnInit {
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

  final EnvironmentService environmentService;
  Environment env;
  String selectedEnvironment;
  bool showSaveDialog = false;
  bool showLoadDialog = false;

  EnvironmentComponent(this.environmentService);

  ItemRenderer difficultyRenderer =
    (d) => _prettyDifficultyNames[d];
  ItemRenderer rankRenderer =
    (r) => _prettyRankNames[r];

  @override
  void ngOnInit() {
    if (environmentService.isNotEmpty) {
      selectedEnvironment = environmentService.keys.first;
      env = environmentService[selectedEnvironment];
    } else {
      env = Environment();
      selectedEnvironment = null;
      setReasonableDefaults(env);
    }
  }

  void maxTeamBuffs() {
    env.teamAttackDamage = 54;
    env.teamAttackSpeed = 54;
    env.teamCritChance = 27;
    if (env.selfBless) {
      env.teamBless = 40;
    }
  }

  void save() {
    environmentService[selectedEnvironment] = env;
  }

  void load() {
    env = environmentService[selectedEnvironment];
  }

  void deleteEnvironment(String key) {
    environmentService.remove(key);
  }

  static void setReasonableDefaults(Environment e) {
    e.dt = true;
    e.selfBless = true;
    e.useAverageUpgrade = true;
    e.helpful = true;
    e.unitRank = Rank.S;
  }
}
