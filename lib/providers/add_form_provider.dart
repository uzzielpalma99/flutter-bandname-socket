import 'package:flutter/material.dart';
import 'package:band_names/models/emprendimiento.dart';

class AddFormProvider extends ChangeNotifier {

  GlobalKey<FormState> emprendimientoFormKey = GlobalKey<FormState>();

  List<Emprendimiento> emprendimientos = [];

  String emprendedor = '';
  String actividades = '';
  String emprendimiento = '';
  String descripcion = '';
  String localidad = '';

  TextEditingController emprendedorController = TextEditingController();
  TextEditingController actividadesController = TextEditingController();
  TextEditingController emprendimientoController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController localidadController = TextEditingController();


  bool validateForm() {
    return emprendimientoFormKey.currentState!.validate() ? true : false;
  }

  void clearInformation()
  {
    emprendedor = '';
    actividades = '';
    emprendimiento = '';
    descripcion = '';
    localidad = '';
    notifyListeners();
  }

  void removerEmprendimiento(String id) {

    for (int i = 0; i < emprendimientos.length; i++) {
      if (emprendimientos[i].id == id) {
        emprendimientos.remove(emprendimientos[i]);
      }
    }

    notifyListeners();
  }

}
