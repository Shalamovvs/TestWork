import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/MainEvent.dart';
import 'package:myapp/bloc/MainState.dart';
import 'package:myapp/models/repos/Repos.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    add(MainLoad());
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    yield MainLoading();
    yield MainSuccess(reposList: await _loadRep());
  }
}

Future<List<Rep>> _loadRep() async {
  var dio = Dio();
  Response response = await dio.get('https://api.github.com/repositories');
  print('${response.data}');
  List<Rep> repList = (response.data as List<dynamic>).map((item) => Rep.fromMap(item)).toList();

  return repList;
}
