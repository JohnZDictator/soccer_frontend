import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_frontend/bloc_observer.dart';
import 'package:soccer_frontend/club/club.dart';
import 'package:soccer_frontend/club/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:soccer_frontend/match_fix/match_fix.dart';
import 'package:soccer_frontend/player/bloc/player_bloc.dart';
import 'package:soccer_frontend/player/bloc/player_event.dart';
import 'package:soccer_frontend/player/data_provider/player_data.dart';
import 'package:soccer_frontend/player/repository/repository.dart';
import 'package:soccer_frontend/result_fix/result_fix.dart';
import 'package:soccer_frontend/stadium/models/models.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final ClubRepository clubRepository = ClubRepository(
    clubDataProvider: ClubDataProvider(
      httpClient: http.Client(),
    ),
  );
  final MatchFixRepository matchFixRepository = MatchFixRepository(
    matchFixDataProvider: MatchFixDataProvider(
      httpClient: http.Client(),
    ),
  );
  final PlayerRepository playerRepository = PlayerRepository(
    playerDataProvider: PlayerDataProvider(
      httpClient: http.Client(),
    ),
  );
  final ResultFixRepository resultFixRepository = ResultFixRepository(
    resultFixDataProvider: ResultFixDataProvider(
      httpClient: http.Client(),
    ),
  );
  final StadiumRepository stadiumRepository = StadiumRepository(
    stadiumDataProvider: StadiumDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(
    MyApp(
      clubRepository: clubRepository,
      matchFixRepository: matchFixRepository,
      playerRepository: playerRepository,
      resultFixRepository: resultFixRepository,
      stadiumRepository: stadiumRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    @required this.clubRepository,
    @required this.matchFixRepository,
    @required this.playerRepository,
    @required this.resultFixRepository,
    @required this.stadiumRepository,
  }) : assert(
          clubRepository != null &&
              matchFixRepository != null &&
              playerRepository != null &&
              resultFixRepository != null &&
              stadiumRepository != null,
        );

  final ClubRepository clubRepository;
  final MatchFixRepository matchFixRepository;
  final PlayerRepository playerRepository;
  final ResultFixRepository resultFixRepository;
  final StadiumRepository stadiumRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ClubRepository>(
          create: (_) => this.clubRepository,
        ),
        RepositoryProvider<MatchFixRepository>(
          create: (_) => this.matchFixRepository,
        ),
        RepositoryProvider<PlayerRepository>(
          create: (_) => this.playerRepository,
        ),
        RepositoryProvider<ResultFixRepository>(
          create: (_) => this.resultFixRepository,
        ),
        RepositoryProvider<StadiumRepository>(
          create: (_) => this.stadiumRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ClubBloc>(
            create: (_) => ClubBloc(
              clubRepository: this.clubRepository,
            )..add(ClubLoad()),
          ),
          BlocProvider<MatchFixBloc>(
            create: (_) => MatchFixBloc(
              matchFixRepository: this.matchFixRepository,
            )..add(MatchFixLoad()),
          ),
          BlocProvider<PlayerBloc>(
            create: (_) => PlayerBloc(
              playerRepository: this.playerRepository,
            )..add(PlayerLoad()),
          ),
          BlocProvider<ResultFixBloc>(
            create: (_) => ResultFixBloc(
              resultFixRepository: this.resultFixRepository,
            )..add(ResultFixLoad()),
          ),
          BlocProvider<StadiumBloc>(
            create: (_) => StadiumBloc(
              stadiumRepository: this.stadiumRepository,
            )..add(StadiumLoad()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Soccer App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          onGenerateRoute: ClubAppRoute.generateRoute,
        ),
      ),
    );
  }
}
