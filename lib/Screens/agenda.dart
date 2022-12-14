// ignore_for_file: file_names, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, prefer_const_constructors, camel_case_types

import 'package:angy/Api/bd_agenda.dart';
import 'package:angy/Screens/nuevaCita.dart';
import 'package:flutter/material.dart';
import 'principal.dart';

class AgendaPage extends StatelessWidget {
  static String id = 'Agenda_Page'; //Variable que obtendra la ruta de la pantalla

  @override
  Widget build(BuildContext context) {
    /**
     *  Variable que contendra el tamaño de la pantalla del dispositivo
     * Ayudará para que la app sea responsiva
     */
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, PrincipalPage.id, (route) => false); // Regreso a la pantalla principal
            },
          ),
          /*
         * Texto del encabezado
        */
          title: const Text(
            'Agenda',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: sizeScreen.height * .03),
            /**
             * Widget propio para crear una nueva cita
             * Se le manda el contexto para obtener el tamaño de pantalla
             */
            _buttonNuevaCita(context),
            SizedBox(height: sizeScreen.height * .02),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: sizeScreen.width * .1),
                child: Column(
                  children: [
                    //Linea horizontal
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sizeScreen.height * .002),

                    //Zona de las citas
                    Expanded(
                      child: ListView.builder(
                        itemCount: servicio.length,
                        itemBuilder: (context, int index) {
                          return Card(
                            color: Color(0xff363636),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                            child: ListTile(
                              title: Text(
                                cliente.values.elementAt(index),
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                fechaHoraCita.values.elementAt(index),
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Text(
                                servicio.values.elementAt(index),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Widget propio del boton "Nueva cita"
Widget _buttonNuevaCita(BuildContext context) {
  final sizeScreen = MediaQuery.of(context).size;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Color(0xff171717),
      padding: EdgeInsets.symmetric(
        horizontal: sizeScreen.width * .08,
        vertical: sizeScreen.height * .025,
      ),
      //Redondear esquinas
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: const Text(
      'Nueva cita',
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {
      //Navegar a pagina para generar una nueva cita
      Navigator.of(context).pushNamed(
                NuevaCitaPage.id);
    },
  );
}
