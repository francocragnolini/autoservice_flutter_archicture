import 'package:flutter/material.dart';
import 'dart:developer';

import '../../themes/autoservice_theme.dart';

///NOTAS:
///imageUrl no funciona: mostrar una imagen de fallback
/// poner la propiedad imageUrl como opcional con valor por defecto

class CartItem extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  const CartItem(
      {super.key,
      required this.price,
      required this.name,
      required this.description,
      required this.id,
      this.imageUrl = "assets/broken_image.png"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
          color: AutoserviceTheme.dark().backgroundColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x411D2429),
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AutoserviceTheme.darkTextTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),

              ///
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                child: Text(
                  '\$$price',
                  textAlign: TextAlign.end,
                  style: AutoserviceTheme.darkTextTheme.bodyText1,
                ),
              ),
              //AGREGAR UN GESTURE DETECTOR ONTAP
              // ES PANTALLA TACTIL
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 4, 0),
                child: IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    log("Articulo eliminado del carrito");
                    // TODO: eliminate from memory the product
                    // update the total's purchase
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
