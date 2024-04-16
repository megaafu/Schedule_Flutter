import 'package:routefly/routefly.dart';

import 'app/(public)/home_page.dart' as a0;
import 'app/(public)/note_page.dart' as a1;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/note',
    uri: Uri.parse('/note'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.NotePage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  home: '/home',
  note: '/note',
);
