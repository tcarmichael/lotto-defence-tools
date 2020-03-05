import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';
import 'package:lotto_defence_tools/src/components/environment/environment_component.dart';
import 'package:lotto_defence_tools/src/components/specialties/specialties_component.dart';

import 'src/components/profile/profile_component.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    DarkThemeDirective,
    EnvironmentComponent,
    MaterialButtonComponent,
    MaterialExpansionPanel,
    ProfileComponent,
    SpecialtiesComponent,
    ],
  providers: [materialProviders],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
  void optimize() {

  }
}
