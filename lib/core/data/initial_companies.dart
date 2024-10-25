import 'package:test_task_company/core/domain/entity/company_entity.dart';

final yandex = CompanyEntity.create(
    name: 'Yandex',
    fullName: 'Савиновский Артем Геннадьевич',
    phone: '+7(495)739-70-00',
    email: 'pr@yandex-team.ru',
    website: 'http://yandex.ru',
    address: const Address(
      postCode: '119021',
      city: 'Москва',
      street: 'Льва Толстого',
      house: '16',
      geolocation: Geolocation(
        latitude: 55.7339999,
        longitude: 37.5889348,
      ),
    )
);

final vk = CompanyEntity.create(
    name: 'ВКонтакте',
    fullName: 'Кириенко Владимир Сергеевич',
    phone: '+7(800)234-80-88',
    email: 'caresupport@vk.company',
    website: 'http://vk.com',
    address: const Address(
      postCode: '125167',
      city: 'Москва',
      street: 'Ленинградский проспект',
      house: '39/79',
      geolocation: Geolocation(
        latitude: 55.7966121,
        longitude: 37.5377207,
      ),
    )
);
