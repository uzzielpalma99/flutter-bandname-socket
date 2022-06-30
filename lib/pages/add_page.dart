import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uuid/uuid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:band_names/models/emprendimiento.dart';

import 'package:band_names/ui/buttons/custom_outlined_button.dart';

import 'package:band_names/ui/inputs/custom_inputs.dart';
import 'package:band_names/providers/add_form_provider.dart';

var uuid = Uuid();

class AddPage extends StatelessWidget {


  const AddPage({Key? key}) : super(key: key);
  
  @override  
  Widget build(BuildContext context) {
    final nameCharacters = RegExp(r'^[a-zA-Z\- ]+$');
    final anyCharacters = RegExp(r'^.+');
    final addFormProvider = Provider.of<AddFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ECM App'),
      ),
      body:SingleChildScrollView(
            child: Container(
              width: 650,
              height: 800,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 5),
              color: Colors.grey.shade300.withOpacity(0.5),
              child: Form(
                  key: addFormProvider.emprendimientoFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Agrega un nuevo emprendimiento',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            height: 1.2,
                            color: const Color(0xff2E5899),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Flexible(
                        child: TextFormField(
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                            addFormProvider.emprendedor = value;
                          },
                          validator: (value) {
                            return nameCharacters.hasMatch(value ?? '')
                            ? null
                            : 'Ingrese un emprendedor';
                          },
                          style: const TextStyle(color: Color(0xff324057)),
                          decoration: CustomInputs.formInputDecoration(
                              label: 'Emprendedor',
                              icon: Icons.person_outlined,
                              //maxWidth: 119
                              ),
                        ),
                      ),

                       const SizedBox(
                        height: 20,
                      ),

                      Flexible(
                        child: TextFormField(
                          maxLines: 8,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                           addFormProvider.actividades = value;
                          },
                          validator: (value) {
                            return anyCharacters.hasMatch(value ?? '')
                            ? null
                            : 'Ingrese las actividades';
                          },
                          style: const TextStyle(color: Color(0xff324057)),
                          decoration: CustomInputs.formInputDecoration(
                              label: 'Actividades',
                              icon: Icons.event_note_outlined,
                              ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Flexible(
                        child: TextFormField(
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                           addFormProvider.emprendimiento = value;
                          },
                          validator: (value) {
                            return anyCharacters.hasMatch(value ?? '')
                            ? null
                            : 'Ingrese un emprendimiento';
                          },
                          style: const TextStyle(color: Color(0xff324057)),
                          decoration: CustomInputs.formInputDecoration(
                              label: 'Emprendimiento',
                              icon: Icons.construction_outlined,
                              //maxWidth: 119
                              ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Flexible(
                        child: TextFormField(
                          maxLines: 2,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                           addFormProvider.descripcion = value;
                          },
                          validator: (value) {
                            return anyCharacters.hasMatch(value ?? '')
                            ? null
                            : 'Ingrese una descripción';
                          },
                          style: const TextStyle(color: Color(0xff324057)),
                          decoration: CustomInputs.formInputDecoration(
                              label: 'Descripción',
                              icon: Icons.description_outlined,
                              //maxWidth: 119
                              ),
                        ),
                      ),


                      const SizedBox(
                        height: 20,
                      ),

                      Flexible(
                        child: TextFormField(
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {
                           addFormProvider.localidad = value;
                          },
                          validator: (value) {
                            return anyCharacters.hasMatch(value ?? '')
                            ? null
                            : 'Ingrese una localidad';
                          },
                          style: const TextStyle(color: Color(0xff324057)),
                          decoration: CustomInputs.formInputDecoration(
                              label: 'Localidad',
                              icon: Icons.place_outlined,
                              //maxWidth: 119
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      CustomOutlinedButton(
                      onPressed: () {
                        final isValid = addFormProvider.validateForm();
                          if (isValid) {
                            agregarEmprendimiento(addFormProvider);
                            addFormProvider.clearInformation();
                            Navigator.pop(context);
                          }
                      },
                      text: 'Agregar',
                      bgColor: const Color(0xFFD20030),
                    ),
                      
                      
                    ],
                  )),
            ),
          ),
    );
  }

  void agregarEmprendimiento(AddFormProvider addFormProvider) {
    final nuevoEmprendimiento = Emprendimiento(
      id: uuid.v4(),
      emprendedor: addFormProvider.emprendedor, 
      actividades: addFormProvider.actividades, 
      emprendimiento: addFormProvider.emprendimiento, 
      descripcion: addFormProvider.descripcion, 
      localidad: addFormProvider.localidad, 
      );

    addFormProvider.emprendimientos.add(nuevoEmprendimiento);

  }

  void addFakeOrderForCurrentCustomer() {
    // final order = ShopOrder(
    //   price: faker.randomGenerator.integer(500, min: 10)
    //   );

    // order.customer.target = _customer;
    // _store.box<Emprendimiento>().put(order);
  }
}