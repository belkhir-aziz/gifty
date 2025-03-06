import 'package:datingapp/models/businessLayer/base.dart';
import 'package:flutter/material.dart';

class BaseRoute extends Base {
  const BaseRoute({super.key, a, o, r});

  @override
  BaseRouteState createState() => BaseRouteState();
}

class BaseRouteState<T extends BaseRoute> extends BaseState<T> with RouteAware {
  BaseRouteState() : super();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {}
}
