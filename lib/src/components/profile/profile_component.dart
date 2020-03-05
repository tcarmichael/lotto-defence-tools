import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../../../core.dart';
import '../../services/profile_service.dart';

ProfileService profileServiceFactory() => ProfileService(window.localStorage);

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
  providers: [FactoryProvider(ProfileService, profileServiceFactory), materialProviders],
  exports: [RuneOptions, Title],
)
class ProfileComponent implements OnInit {
  final ProfileService profileService;
  Profile profile;

  ProfileComponent(this.profileService);

  @override
  void ngOnInit() {
    profile = profileService.getProfile();
  }

  void save() {
    profileService.saveProfile(profile);
  }

  void clear() {
    profileService.clearProfiles();
  }

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
