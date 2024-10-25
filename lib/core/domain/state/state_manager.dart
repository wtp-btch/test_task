import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_company/core/domain/entity/company_entity.dart';
import 'package:test_task_company/core/domain/state/state_holder.dart';

final stateManagerProvider = Provider<StateManager>((ref) {
  return StateManager(ref.watch(stateHolderProvider.notifier));
});

class StateManager extends StateNotifier<List<CompanyEntity>> {

  StateManager(this._stateHolder) : super(_stateHolder.state);
  final StateHolder _stateHolder;

  List<CompanyEntity> get companies => state;
  List<String> get selectedCompanies => _stateHolder.selectedCompanies;

  void addCompany(CompanyEntity company) {
    _stateHolder.addCompany(company);
    state = _stateHolder.state;
  }

  void updateCompany(CompanyEntity updatedCompany) {
    _stateHolder.updateCompany(updatedCompany);
    state = _stateHolder.state;
  }

  void deleteCompany(String id) {
    _stateHolder.deleteCompany(id);
    state = _stateHolder.state;
  }
  void deleteSelectedCompanies() {
    _stateHolder.deleteSelectedCompanies();
    state = _stateHolder.state;
  }

  void clearSelectedCompanies() {
    _stateHolder.clearSelectedCompanies();
    state = _stateHolder.state;
  }

  void toggleCompanySelection(String id) {
    _stateHolder.toggleCompanySelection(id);
    state = _stateHolder.state;
  }

  bool isCompanySelected(String id) {
    return _stateHolder.isCompanySelected(id);
  }
}
