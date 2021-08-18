import 'package:flutter/material.dart';
import 'package:management249/provider/api_services.dart';
import 'package:provider/provider.dart';

import 'manager_app.dart';

void main() {
  runApp(
      Provider<ApiService>(create: (context) => ApiService(), child: MyApp()));
}
