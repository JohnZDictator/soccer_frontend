import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/bloc_observer.dart';
import 'package:soccer_frontend/club/club.dart';
import 'package:soccer_frontend/club/repository/repository.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  final ClubRepository clubRepository = ClubRepository(
    clubDataProvider: ClubDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      clubRepository: clubRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ClubRepository clubRepository;
  MyApp({@required this.clubRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ClubRepository>(
          create: (_) => this.clubRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ClubBloc>(
            create: (_) => ClubBloc(
              clubRepository: this.clubRepository,
            )..add(ClubLoad()),
            child: MaterialApp(
              title: 'Game Fixture',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              onGenerateRoute: ClubAppRoute.generateRoute,
            ),
          ),
        ],
      ),
    );
  }
}
