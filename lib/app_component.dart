import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';
import 'package:lotto_defence_tools/src/components/environment/environment_component.dart';
import 'package:lotto_defence_tools/src/components/specialties/specialties_component.dart';
import 'package:lotto_defence_tools/src/core/models/environment.dart';
import 'package:lotto_defence_tools/src/core/models/ep_list.dart';
import 'package:lotto_defence_tools/src/core/models/gem_list.dart';
import 'package:lotto_defence_tools/src/core/models/specialty_list.dart';
import 'package:lotto_defence_tools/src/services/environment_service.dart';
import 'package:lotto_defence_tools/src/services/profile_service.dart';

import 'core.dart';
import 'src/components/profile/profile_component.dart';

EnvironmentService environmentServiceFactory() => EnvironmentService(window.localStorage);
ProfileService profileServiceFactory() => ProfileService(window.localStorage);

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    materialInputDirectives,
    AutoFocusDirective,
    EnvironmentComponent,
    MaterialButtonComponent,
    MaterialDialogComponent,
    MaterialExpansionPanel,
    MaterialSaveCancelButtonsDirective,
    MaterialSelectComponent,
    MaterialSelectItemComponent,
    MaterialYesNoButtonsComponent,
    ModalComponent,
    NgIf,
    NgFor,
    ProfileComponent,
    SpecialtiesComponent,
  ],
  providers: [
    FactoryProvider(EnvironmentService, environmentServiceFactory),
    FactoryProvider(ProfileService, profileServiceFactory),
    materialProviders
  ],
)
class AppComponent implements OnInit {
  // Services
  final EnvironmentService environmentService;
  final ProfileService profileService;

  // Profile component
  Profile profile;

  // Environment component
  Environment env;
  String selectedEnvironment;
  bool showSaveDialog = false;
  bool showLoadDialog = false;

  // Placeholders
  SpecialtyList sp = SpecialtyList();
  EpList ep = EpList();
  GemList gems = GemList();

  SpecialtyList newSp;

  AppComponent(this.environmentService, this.profileService);

  @override
  void ngOnInit() {
    // Load the profile.
    profile = profileService.getProfile();

    // Load the environment.
    if (environmentService.isNotEmpty) {
      selectedEnvironment = environmentService.keys.first;
      env = environmentService[selectedEnvironment];
    } else {
      env = Environment();
      selectedEnvironment = null;
      setReasonableDefaults(env);
    }
  }

  void saveProfile() {
    profileService.saveProfile(profile);
  }

  void clearProfile() {
    profileService.clearProfiles();
    profile = Profile();
  }

  void loadEnvironment() {
    env = environmentService[selectedEnvironment];
  }

  void saveEnvironment() {
    environmentService[selectedEnvironment] = env;
  }

  void deleteEnvironment(String key) {
    environmentService.remove(key);
  }

  void optimize() {
    newSp = optimizeSp(profile, env, sp, ep, gems);
  }

  static void setReasonableDefaults(Environment e) {
    e.dt = true;
    e.selfBless = true;
    e.useAverageUpgrade = true;
    e.helpful = true;
    e.unitRank = Rank.S;
  }
}
