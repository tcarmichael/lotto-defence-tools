import 'environment.dart';
import 'ep_list.dart';
import 'gem_list.dart';
import 'profile.dart';
import 'specialty_list.dart';

SpecialtyList optimizeSp(Profile profile, Environment env, SpecialtyList sp, EpList ep, GemList gems) {
  var epStats = ep.calcStats();
  var gemStats = gems.calcStats(profile.xp);
  var newSp = sp;
  newSp.optimize(profile, env, epStats, gemStats);
  return newSp;
}

class Optimizer {
  Profile profile = Profile.empty();
  Environment env = Environment();
  SpecialtyList selectedSpecialties = SpecialtyList();
  EpList selectedEps = EpList();
  GemList selectedGems = GemList();

  void optimizeSp() {
    var epStats = selectedEps.calcStats();
    var gemStats = selectedGems.calcStats(profile.xp);
    selectedSpecialties.optimize(profile, env, epStats, gemStats);
  }
}
