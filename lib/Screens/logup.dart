// ignore_for_file: use_key_in_widget_constructors, slash_for_doc_comments, camel_case_types, unused_element, avoid_print

import 'package:angy/Screens/principal.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
//import 'package:date_field/date_field.dart';

class LogUpPage extends StatefulWidget {
  static String id = "logUp_page"; //Variable que obtendra la ruta de la pantalla

  @override
  State<StatefulWidget> createState() => LogUpPageState();
}

class LogUpPageState extends State<LogUpPage> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    final firstName = TextEditingController(); // Variable para obtener el nombre
    final lastName = TextEditingController(); // Variable para obtener el apellido
    final email = TextEditingController(); // Variable para el email
    final pass = TextEditingController(); // Variable para la contraseña
    final confPass = TextEditingController(); // Variabe para obtener la confirmacion de contraseña

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
            Navigator.of(context).pop(); // Regreso a la pantalla Log In
          },
        ),
        /*
         * Teto del encabezado 
        */
        title: const Text(
          'Registro',
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*
             * Seccion de formulario
            */
          _textFieldName(sizeScreen, firstName),
          SizedBox(height: sizeScreen.height * .02),
          _textFieldLastName(sizeScreen, lastName),
          SizedBox(height: sizeScreen.height * .02),
          _textFieldEmail(sizeScreen, email),
          SizedBox(height: sizeScreen.height * .02),
          _textFieldPassword(sizeScreen, pass),
          SizedBox(height: sizeScreen.height * .02),
          _textFieldConfirmPassword(sizeScreen, confPass),
          SizedBox(height: sizeScreen.height * .03),
          _buttonSingUp(
              context, sizeScreen, firstName, lastName, email, pass, confPass)
        ],
      ),
    ));
  }
}

/*
 * Seccion de metodos, funciones y widgets propios
*/
Widget _textFieldName(Size size, fName) {
  return _textFieldGeneral(
    labelText: 'Nombre',
    icon: Icons.person_outline,
    hintText: 'Nombre',
    sizeScreen: size,
    myControler: fName,
  );
}

Widget _textFieldLastName(Size size, lName) {
  return _textFieldGeneral(
    labelText: 'Apellido',
    icon: Icons.person_outline,
    hintText: 'Apellido',
    sizeScreen: size,
    myControler: lName,
  );
}

Widget _textFieldEmail(Size size, email) {
  return _textFieldGeneral(
    labelText: 'Correo',
    icon: Icons.email_outlined,
    hintText: 'example@hotmail.com',
    sizeScreen: size,
    myControler: email,
  );
}

Widget _textFieldPassword(Size size, pass) {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    obscureText: true,
    sizeScreen: size,
    myControler: pass,
  );
}

Widget _textFieldConfirmPassword(Size size, confPass) {
  return _textFieldGeneral(
    labelText: 'Confirmar contraseña',
    icon: Icons.lock_outline_rounded,
    hintText: '*********',
    sizeScreen: size,
    obscureText: true,
    myControler: confPass,
  );
}

Widget _buttonSingUp(
    BuildContext context, Size size, fName, lName, email, pass, confPass) {
      // Variables locales que serviran como auxiliares
  String _fNameVar = '';
  String _lNameVar = '';
  String _emailVar = '';
  String _passVar = '';
  String _confPassVar = '';
  Color coloor = Colors.grey.shade700; // Color de boton y otros widgets

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: coloor,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * .1,
        vertical: size.height * .029,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      'Registrarse',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato'),
    ),
    onPressed: () {

      // Navegacion directa a la pantalla principal
      Navigator.of(context).pushNamedAndRemoveUntil(
          PrincipalPage.id, (Route<dynamic> route) => false);

      /**
       * Recuperacion de lo digitado en elos text labels
       * Se guardan en su variable local correspondiente
       */
      _fNameVar = fName.text;
      _lNameVar = lName.text;
      _emailVar = email.text; 
      _passVar = pass.text; 
      _confPassVar = confPass.text;
      // Limpieza de los controladores
      @override
      void dispose() {
        fName.dispose();
        lName.dispose();
        email.dispose();
        pass.dispose();
        confPass.dispose();
      }

/**
 * Validaciones para el registro de un nuevo usuario
 * Comentado por el momento para el registro instantaneo
      // Si no estan vacias los text labels...
      if (_emailVar != '' &&
          _passVar != '' &&
          _fNameVar != '' &&
          _lNameVar != '' &&
          _confPassVar != '') {
            //Si se tiene una extencion de correo electronico...
        if (_emailVar.contains('@hotmail.com') ||
            _emailVar.contains('@outlook.com') ||
            _emailVar.contains('@gmail.com')) {
          
          // Si el email digitado existe...
          if (users.containsKey(_emailVar)) {
            AwesomeDialog(
              dialogType: DialogType.warning,
              context: context,
              // ignore: deprecated_member_use
              animType: AnimType.SCALE,
              title: 'Correo electronico',
              body: const Center(
                child: Text(
                  'El correo digitado ya esta registrado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato'),
                ),
              ),
              btnOkColor: coloor,
              btnOkText: 'Ok',
              btnOkOnPress: () {},
            ).show();
          }
          
          //Si las contraseñas no son iguales...
          if (_passVar != _confPassVar) {
            AwesomeDialog(
              dialogType: DialogType.noHeader,
              context: context,
              // ignore: deprecated_member_use
              animType: AnimType.SCALE,
              title: 'Correo electronico',
              body: const Center(
                child: Text(
                  'La contraseñas digitadas son diferentes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato'),
                ),
              ),
              btnOkColor: coloor,
              btnOkText: 'Ok',
              btnOkOnPress: () {},
            ).show();
          } else {
            /**
             * Si todo esta bien Ingresa como usuario y sucede lo siguiente:
             * 1.- Se agrega el correo electronico y contraseña la BD local
             * 2.- Se agrega el nombre del usuario a la BD local
             * 3.- Se guarda el correo digitado en una variable local
             * 4.- Se navega a la pagina rincipal
            */
            users.addAll({_emailVar: _passVar});
            usersName.addAll({_emailVar: '$_fNameVar $_lNameVar'});

            correoo = _emailVar;

            Navigator.of(context).pushNamedAndRemoveUntil(
                PrincipalPage.id,
                (Route<dynamic> route) => false);
          }
        } else {
          AwesomeDialog(
            dialogType: DialogType.noHeader,
            context: context,
            // ignore: deprecated_member_use
            animType: AnimType.SCALE,
            title: 'Correo electronico',
            body: const Center(
              child: Text(
                'Verifique que su correo contenga alguna de las siguientes extenciones.\n@hotmail.com, @gmail.com ó @outlook.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
            ),
            btnOkColor: coloor,
            btnOkText: 'Ok',
            btnOkOnPress: () {},
          ).show();
        }
      } else {
        AwesomeDialog(
          dialogType: DialogType.noHeader,
          context: context,
          // ignore: deprecated_member_use
          animType: AnimType.SCALE,
          title: 'Correo electronico',
          body: const Center(
            child: Text(
              'Llene todos los campos.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato'),
            ),
          ),
          btnOkColor: coloor,
          btnOkText: 'Ok',
          btnOkOnPress: () {},
        ).show();
      }
        */
    },
  );
}

/**
 * Clase generica de text labels
 */
class _textFieldGeneral extends StatefulWidget {
  final String labelText; //Texto del label
  final String? hintText; //Texto de muestra
  final TextInputType? keyboardType;
  final IconData icon;
  final bool obscureText;
  final TextEditingController myControler;
  final Size sizeScreen;
  
/**
   * Constructor para los TextLabels
   */
  const _textFieldGeneral({
    required this.labelText,
    this.hintText,
    this.keyboardType,
    required this.icon,
    this.obscureText = false,
    required this.sizeScreen,
    required this.myControler,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {
  Color coloor = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: widget.sizeScreen.width * .15,
      ),
      child: TextField(
        style: TextStyle(color: coloor),
        controller: widget.myControler,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: coloor),
          labelStyle: TextStyle(color: coloor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          suffixIcon: Icon(widget.icon, color: coloor),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
