import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_company/core/domain/entity/company_entity.dart';

class CompanyEditScreen extends ConsumerStatefulWidget {
  const CompanyEditScreen({
    required this.onSave,
    super.key,
    this.company,
  });

  final CompanyEntity? company;
  final void Function(CompanyEntity) onSave;

  @override
  ConsumerState<CompanyEditScreen> createState() => _CompanyEditScreenState();
}

class _CompanyEditScreenState extends ConsumerState<CompanyEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _id;
  late String _name;
  late String _fullName;
  late String _phone;
  late String _email;
  late String _website;
  late Address _address;

  @override
  void initState() {
    super.initState();
    _id = widget.company?.id ?? '';
    _name = widget.company?.name ?? '';
    _fullName = widget.company?.fullName ?? '';
    _phone = widget.company?.phone ?? '';
    _email = widget.company?.email ?? '';
    _website = widget.company?.website ?? '';
    _address = widget.company?.address ?? const Address(
      postCode: '',
      city: '',
      street: '',
      house: '',
      geolocation: Geolocation(
        latitude: 0.0,
        longitude: 0.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:
        Text(widget.company == null ? 'Новая компания' : 'Редактирование данных компании'),
        backgroundColor: Colors.purple[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            onChanged: () => setState(() {}),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(
                    labelText: 'Название компании',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите название компании';
                    }
                    return null;
                  },
                  onChanged: (value) => _name = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: _fullName,
                  decoration: const InputDecoration(
                      labelText: 'ФИО контактного лица'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите ФИО контактного лица';
                    }
                    return null;
                  },
                  onChanged: (value) => _fullName = value,
                ),
                TextFormField(
                  initialValue: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: 'Контактный телефон'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите Контактный телефон';
                    }
                    return null;
                  },
                  onChanged: (value) => _phone = value,
                ),
                TextFormField(
                  initialValue: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите Email компании';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Введите корректный Email';
                    }
                    return null;
                  },
                  onChanged: (value) => _email = value,
                ),
                TextFormField(
                  initialValue: _website,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                      labelText: 'Web-сайт'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите web-сайт';
                    }
                    return null;
                  },
                  onChanged: (value) => _website = value,
                ),
                TextFormField(
                  initialValue: _address.postCode,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Почтовый индекс',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите почтовый индекс';
                    }
                    return null;
                  },
                  onChanged: (value) => _address = _address.copyWith(postCode: value),
                ),
                TextFormField(
                  initialValue: _address.city,
                  decoration: const InputDecoration(
                    labelText: 'Город',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите город';
                    }
                    return null;
                  },
                  onChanged: (value) => _address = _address.copyWith(city: value),
                ),
                TextFormField(
                  initialValue: _address.street,
                  decoration: const InputDecoration(
                    labelText: 'Улица',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите улицу';
                    }
                    return null;
                  },
                  onChanged: (value) => _address = _address.copyWith(street: value),
                ),
                TextFormField(
                  initialValue: _address.house,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Дом',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите номер дома';
                    }
                    return null;
                  },
                  onChanged: (value) => _address = _address.copyWith(house: value),
                ),
                TextFormField(
                  initialValue: _address.geolocation.latitude.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Широта',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите широту';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    final latitude = double.tryParse(value) ?? 0.0;
                    _address = _address.copyWith(
                      geolocation: _address.geolocation.copyWith(latitude: latitude),
                    );
                  },
                ),
                TextFormField(
                  initialValue: _address.geolocation.longitude.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Долгота',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Введите долготу';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    final longitude = double.tryParse(value) ?? 0.0;
                    _address = _address.copyWith(
                      geolocation: _address.geolocation.copyWith(longitude: longitude),
                    );
                  },
                ),
                const SizedBox(height: 20),
                if (_formKey.currentState?.validate() ?? false)
                  ElevatedButton(
                    onPressed: () {
                      widget.onSave(
                        CompanyEntity(
                          id: _id,
                          name: _name,
                          fullName: _fullName,
                          phone: _phone,
                          email: _email,
                          website: _website,
                          address: _address,
                        ),
                      );
                      context.pop();
                    },
                    child: const Text('Сохранить'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
