import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:effective_mobile/api/api.dart';
import 'package:effective_mobile/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/local/local.dart';
import 'repositories/offers/offers.dart';
import 'repositories/ticket_offers/tickets_offers.dart';
import 'repositories/tickets/tickets.dart';

import 'features/home/bloc/home_bloc.dart';
import 'features/ticket_offers/bloc/ticket_offers_bloc.dart';
import 'features/tickets/bloc/tickets_bloc.dart';

import 'src/app.dart';
import 'ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(App(sharedPreferences: sharedPreferences));
}
