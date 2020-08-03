import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../../core.dart';

@Component(
  selector: 'profile',
  styleUrls: ['profile_component.css'],
  templateUrl: 'profile_component.html',
  directives: [
    materialInputDirectives,
    materialNumberInputDirectives,
    DropdownSelectValueAccessor,
    DropdownButtonComponent,
    MaterialButtonComponent,
    MaterialDropdownSelectComponent,
    MaterialIconComponent,
    MaterialFabComponent,
    MaterialSelectDropdownItemComponent,
    NgIf,
    NgFor,
  ],
  providers: [materialProviders],
  exports: [RuneOptions, Title],
)
class ProfileComponent {
  @Input()
  Profile profile;

  void removeRune(int index) {
    profile.runes[index] = null;
  }

  void addRune(int index) {
    profile.runes[index] = Rune.empty();
  }

  void onSelect(int index) {
    profile.selectedRuneIndex = index;
  }
}
