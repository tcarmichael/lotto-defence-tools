import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:lotto_defence_tools/src/core/models/specialty.dart';
import 'package:lotto_defence_tools/src/core/models/specialty_list.dart';

import '../../../core.dart';

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    var list = map.putIfAbsent(key(element), () => []);
    list.add(element);
  }
  return map;
}

@Component(
  selector: 'specialties',
  styleUrls: ['specialties_component.css'],
  templateUrl: 'specialties_component.html',
  directives: [
    materialInputDirectives,
    materialNumberInputDirectives,
    DropdownSelectValueAccessor,
    DropdownButtonComponent,
    MaterialButtonComponent,
    MaterialDropdownSelectComponent,
    MaterialTabComponent,
    MaterialTabPanelComponent,
    MaterialToggleComponent,
    MaterialSelectDropdownItemComponent,
    NgIf,
    NgFor,
  ],
  providers: [materialProviders],
  exports: [],
)
class SpecialtiesComponent implements OnInit {
  @Input()
  SpecialtyList specialtyList;
  Map<Title, List<Specialty>> spByTitle;

  @override
  void ngOnInit() {
    spByTitle = groupBy(specialtyList.allSpecialties, (sp) => sp.data.requiredTitle);
  }

  void setMaxPoints(Specialty sp) {
    sp.pointsBought = sp.data.maxPoints;
  }
}
