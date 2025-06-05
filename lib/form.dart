import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Crea un TextEditingController único para cada campo de texto
  final TextEditingController _idUsuarioController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _fechaRegistroController = TextEditingController();
  final TextEditingController _tipoUsuarioController = TextEditingController();
  final TextEditingController _idAdminController = TextEditingController();

  @override
  void dispose() {
    // Asegúrate de desechar todos los controladores cuando el widget se desmonte
    _idUsuarioController.dispose();
    _nombreController.dispose();
    _apellidosController.dispose();
    _correoController.dispose();
    _telefonoController.dispose();
    _direccionController.dispose();
    _fechaRegistroController.dispose();
    _tipoUsuarioController.dispose();
    _idAdminController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
            title: const Text("Usuario"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _idUsuarioController, // Asigna un controlador único
                  fieldName: "Id Usuario",
                  myIcon: Icons.account_balance,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _nombreController, // Asigna un controlador único
                  fieldName: "Nombre",
                  myIcon: Icons.person,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _apellidosController, // Asigna un controlador único
                  fieldName: "Apellidos",
                  myIcon: Icons.calendar_month,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _correoController, // Asigna un controlador único
                  fieldName: "Correo",
                  myIcon: Icons.phone,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _telefonoController, // Asigna un controlador único
                  fieldName: "Telefono",
                  myIcon: Icons.email,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _direccionController, // Asigna un controlador único
                  fieldName: "Direccion",
                  myIcon: Icons.house,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _fechaRegistroController, // Asigna un controlador único
                  fieldName: "Fecha de Registro",
                  myIcon: Icons.credit_card,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _tipoUsuarioController, // Asigna un controlador único
                  fieldName: "Tipo de Usuario",
                  myIcon: Icons.credit_card,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              MyTextField(
                  myController: _idAdminController, // Asigna un controlador único
                  fieldName: "Id Admin",
                  myIcon: Icons.credit_card,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              // Pasa el texto de cada controlador individualmente
              productName: _idUsuarioController.text, // Ejemplo: Aquí podrías pasar el ID del cliente o un nombre consolidado si lo deseas
              productDescription: _nombreController.text, // Ejemplo: Aquí podrías pasar el nombre completo
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}