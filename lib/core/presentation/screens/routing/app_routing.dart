import 'package:go_router/go_router.dart';
import 'package:test_task_company/core/domain/entity/company_entity.dart';
import 'package:test_task_company/core/presentation/screens/company_detail_screen_page.dart';
import 'package:test_task_company/core/presentation/screens/company_edit_screen_page.dart';
import 'package:test_task_company/core/presentation/screens/company_list_screen_page.dart';

final router = GoRouter(
  initialLocation: '/company',
  routes: [
    GoRoute(
      path: '/company',
      builder: (context, state) => const CompanyListScreen(),
    ),
    GoRoute(
      path: '/view',
      builder: (context, state) {
        final company = state.extra as CompanyEntity;
        return CompanyDetailScreen(company: company);
      },
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => CompanyEditScreen(
        onSave: state.extra! as void Function(CompanyEntity),
      ),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) {
        final extra = state.extra! as Map<String, dynamic>;
        final company = extra['company'] as CompanyEntity;
        final updateCompany = extra['updateCompany'] as void Function(CompanyEntity);
        return CompanyEditScreen(
          company: company,
          onSave: updateCompany,
        );
      },
    ),
  ],
);
