import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_company/core/domain/state/state_holder.dart';
import 'package:test_task_company/core/domain/state/state_manager.dart';
import 'package:test_task_company/core/presentation/widgets/company_card.dart';

class CompanyListScreen extends ConsumerWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(stateHolderProvider);
    final manager = ref.read(stateManagerProvider);

    return Scaffold(
        appBar: AppBar(
          title: manager.selectedCompanies.isNotEmpty
              ? Text('${manager.selectedCompanies.length} выбрано')
              : const Text(
            'Компании',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 150,
          backgroundColor: Colors.purple[100],
          actions: [
            if (manager.selectedCompanies.isNotEmpty)
              IconButton(
                style: ButtonStyle(
                  iconSize: WidgetStateProperty.all(30),
                ),
                icon: const Icon(Icons.delete),
                onPressed: () {
                  manager.deleteSelectedCompanies();
                },
              ),
            IconButton(
                icon: Icon(
                    manager.selectedCompanies.isNotEmpty?
                    Icons.deselect : Icons.select_all_sharp),
                style: ButtonStyle(
                  iconSize: WidgetStateProperty.all(33),
                ),
                onPressed: () {
                  for (var company in companies) {
                    manager.toggleCompanySelection(company.id);
                  }
                }
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: companies.length,
                itemBuilder: (context, id) {
                  final company = companies[id];
                  final isSelected =  manager.isCompanySelected(company.id);
                  return CompanyCard(
                    company: company,
                    isSelected: isSelected,
                    onDelete: () => manager.deleteCompany(company.id),
                    onEdit: () {
                      context.push(
                        '/edit',
                        extra: {
                          'company': company,
                          'updateCompany': manager.updateCompany,
                        },
                      );
                    },
                    // onEdit: () {
                    //   context.push('/detail', extra: company);
                    // },
                    onView: () {
                      context.push(
                        '/view',
                        extra: company,
                      );
                    },
                    onLongPress: () {
                      manager.toggleCompanySelection(company.id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 15),
            child: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.deepPurpleAccent),),
                  onPressed: () {
                    context.push(
                      '/create',
                      extra: manager.addCompany,
                    );
                  },
                  child: const Icon(Icons.add, size: 25),
                )
            )
        )
    );
  }
}
