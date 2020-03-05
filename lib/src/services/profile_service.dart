import 'dart:convert';
import 'dart:html';
import 'package:angular/core.dart';

import '../../core.dart';

@Injectable()
class ProfileService {
  static const String _key = 'PROFILE';
  final Storage localStorage;

  ProfileService(this.localStorage);

  Profile getProfile() {
    if (localStorage.containsKey(_key)) {
      window.console.debug('Loading profile from local storage...');
      try {
        var jsonMap = json.decode(localStorage[_key]) as Map<String, dynamic>;
        return Profile.fromJson(jsonMap);
      } on Exception {
        window.console.debug('Previous profile in local storage is corrupt. Creating a new profile...');
        return Profile.empty();
      }
    } else {
      window.console.debug('Creating new profile...');
      return Profile.empty();
    }
  }

  void saveProfile(Profile profile) {
    window.console.debug('Saving profile...');
    localStorage[_key] = json.encode(profile);
  }

  void clearProfiles() {
    localStorage.remove(_key);
  }
}
