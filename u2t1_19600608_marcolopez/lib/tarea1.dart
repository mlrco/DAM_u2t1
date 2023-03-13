import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'dart:math';

class Tarea1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Tarea1();
  }
}

class _Tarea1 extends State<Tarea1>{
  final textController = TextEditingController();
  String labelTexto = 'Este texto cambia a lo que escribas al presionar el botón del fondo :) \n También puedes cambiar el color!';
  Color labelColor = Colors.blue;
  Color appBarColor = Colors.blue;


  void cambiarColor() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escoja un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: labelColor,
              onColorChanged: (Color color) {
                setState(() {
                  labelColor = color;
                });
              },
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Marco Antonio Lopez Burgara'),
        backgroundColor: appBarColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              setState(() {
                // color aleatorio
                appBarColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            labelTexto,
            style: TextStyle(
              fontSize: 24.0,
              color: labelColor,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: 'Ingrese texto',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Escoja el color'),
            onPressed: cambiarColor,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Cambia el label!'),
            onPressed: () {
              setState(() {
                labelTexto = textController.text;
              });
            },
          ),
        ],
      ),
    );
  }
}