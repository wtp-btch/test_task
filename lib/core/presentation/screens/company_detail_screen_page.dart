import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_company/core/domain/state/state_manager.dart';
import 'package:test_task_company/core/domain/entity/company_entity.dart';

class CompanyDetailScreen extends ConsumerWidget {
  final CompanyEntity company;

  const CompanyDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final manager = ref.read(stateManagerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о компании'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push('/edit', extra: {
                'company': company,
                'updateCompany': manager.updateCompany,
              },);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Название компании: ${company.name}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text(
              'Контакты',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildDetailItem('Полное название', company.fullName),
            _buildDetailItem('Телефон', company.phone),
            _buildDetailItem('Email', company.email),
            _buildDetailItem('Web-сайт', company.website),
            const SizedBox(height: 20),
            const Text(
              'Адрес',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildDetailItem('Почтовый индекс', company.address.postCode),
            _buildDetailItem('Город', company.address.city),
            _buildDetailItem('Улица', company.address.street),
            _buildDetailItem('Дом', company.address.house),
            const SizedBox(height: 20),
            const Text(
              'Геолокация',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildDetailItem('Широта', company.address.geolocation.latitude.toString()),
            _buildDetailItem('Долгота', company.address.geolocation.longitude.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value.isEmpty ? 'Не указано' : value),
          ),
        ],
      ),
    );
  }
}