import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import '../data/datasource/remote/http_remote.dart';
import '../data/datasource/remote/remote.dart';

final getIt = GetIt.I;

Future<void> initializeDI() async {
  // await _data();
}

void _data() async {
  // API ARTICULOS
  getIt.registerSingleton<Remote>(HttpRemote(http.Client()));
}
