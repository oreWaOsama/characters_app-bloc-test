// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_bloc_app/helper/router/app_router.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  AppRouter appRouter;
  MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
