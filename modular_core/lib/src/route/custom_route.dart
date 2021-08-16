import 'package:modular_core/modular_core.dart';
import 'package:modular_core/src/di/bind_context.dart';

import 'modular_route.dart';
import 'route_context.dart';

class CustomRoute extends ModularRoute {
  CustomRoute({
    required String name,
    String tag = '',
    List<ModularRoute> children = const [],
    Uri? uri,
    List<Middleware> middlewares = const [],
    Map<String, ModularRoute>? routeMap,
    ModularRoute? parent,
    Map<Type, BindContext> bindContextEntries = const {},
  }) : super(
          name: name,
          tag: tag,
          children: children,
          uri: uri ?? Uri.parse('/'),
          parent: parent,
          routeMap: routeMap,
          bindContextEntries: bindContextEntries,
        );

  factory CustomRoute.module(String name, {required RouteContext module, List<Middleware> middlewares = const []}) {
    final route = CustomRoute(name: name, middlewares: middlewares);
    return route.addModule(name, module: module) as CustomRoute;
  }

  @override
  ModularRoute copyWith({
    String? name,
    List<Middleware>? middlewares,
    String? tag,
    List<ModularRoute>? children,
    ModularRoute? parent,
    Uri? uri,
    Map<String, ModularRoute>? routeMap,
    Map<Type, BindContext>? bindContextEntries,
  }) {
    return CustomRoute(
      name: name ?? this.name,
      tag: tag ?? this.tag,
      children: children ?? this.children,
      middlewares: middlewares ?? this.middlewares,
      uri: uri ?? this.uri,
      routeMap: routeMap ?? this.routeMap,
      parent: parent ?? this.parent,
      bindContextEntries: bindContextEntries ?? this.bindContextEntries,
    );
  }
}