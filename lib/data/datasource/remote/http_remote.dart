import 'dart:developer';

import 'package:autoservice_app/data/datasource/remote/remote.dart';
import 'package:http/http.dart';

class HttpRemote extends Remote {
  //takes the domain and the endpoint
  final url = Uri.https('z092d.mocklab.io/', 'pizzalist/');

  final Client _client;

  // implementar el llamado a la api.
  // implementar modelo productosDto, ProductosResponseDto, productos.
  // intentar implementar otro llamado a otra api por ejemplo: firebase.

  //Constructor
  HttpRemote(this._client);

  @override
  getAllProducts() {
    try {} catch (error) {
      log(error.toString());
    }
  }

  @override
  getSingleProduct() {
    // TODO: implement getSingleProduct
    throw UnimplementedError();
  }
}
