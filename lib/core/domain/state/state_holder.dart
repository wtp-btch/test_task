import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_company/core/data/initial_companies.dart';
import 'package:uuid/uuid.dart';
import 'package:test_task_company/core/domain/entity/company_entity.dart';

final initialCompanies = [
  yandex,
  vk,
];

final stateHolderProvider = StateNotifierProvider<StateHolder,
    List<CompanyEntity>>(
      (ref) => StateHolder(initialCompanies),
);

class StateHolder extends StateNotifier<List<CompanyEntity>> {
  StateHolder(super.initialCompanies);

  final _uuid = const Uuid();
  List<String> selectedCompanies = [];

  void addCompany(CompanyEntity company) async {
    final newCompany = company.copyWith(id: _uuid.v4());
    state = [...state, newCompany];
  }

  void updateCompany(CompanyEntity updatedCompany) async {
    state = [
      for (final company in state)
        if (company.id == updatedCompany.id) updatedCompany else company,
    ];
  }

  void deleteCompany(String id) {
    state = state.where((company) => company.id != id).toList();
    selectedCompanies.remove(id);
  }

  void deleteSelectedCompanies() {
    state = state.where((company) =>
    !selectedCompanies.contains(company.id)).toList();
    selectedCompanies.clear();
    state = [...state];
  }

  void clearSelectedCompanies() {
    selectedCompanies.clear();
    state = [...state];
  }

  void toggleCompanySelection(String id) {
    if (selectedCompanies.contains(id)) {
      selectedCompanies.remove(id);
    } else {
      selectedCompanies.add(id);
    }
    state = [...state];
  }

  bool isCompanySelected(String id) {
    return selectedCompanies.contains(id);
  }
}
