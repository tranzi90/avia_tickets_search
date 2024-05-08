import 'package:flutter/material.dart';

class App extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  const App({
    super.key,
    required this.sharedPreferences,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient(Dio());

    final localRepository =
        LocalRepository(sharedPreferences: widget.sharedPreferences);

    final offersRepository = OffersRepository(apiClient: apiClient);

    final ticketsRepository = TicketsRepository(apiClient: apiClient);

    final ticketOffersRepository = TicketOffersRepository(apiClient: apiClient);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            localRepository: localRepository,
            offersRepository: offersRepository,
          ),
        ),
        BlocProvider(
          create: (context) => TicketOffersBloc(
            localRepository: localRepository,
            ticketOffersRepository: ticketOffersRepository,
          ),
        ),
        BlocProvider(
          create: (context) => TicketsBloc(
            localRepository: localRepository,
            ticketsRepository: ticketsRepository,
          ),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''),
        ],
        theme: themeData,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
