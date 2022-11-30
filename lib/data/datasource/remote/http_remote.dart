import 'package:autoservice_app/data/datasource/remote/remote.dart';
import 'package:http/http.dart';

class HttpRemote extends Remote {
  // final _basicUrl = 'z092d.mocklab.io/';

  // property(Client type from http package)
  final Client _client;

  // constructor: gets the client from Locator.dart
  HttpRemote(this._client);

  final url = Uri.https('z092d.mocklab.io/', '/pizzalist');

  @override
  // HACER EL GET AL ENDPOINT CORRESPONDIENTE
  getAllProducts() async {}

  @override
  getSingleProduct() {
    // TODO: implement getSingleProduct
    throw UnimplementedError();
  }
}
