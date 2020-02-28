import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController horas = TextEditingController();
  TextEditingController minutos = TextEditingController();
  double qntgemas = 0;

  void calculate(){
    double time = double.parse(horas.text)*60 + double.parse(minutos.text);
    setState(() {
      if(time < 60){
      qntgemas = time/3;
      qntgemas.toStringAsFixed(0);
    }else{
      time = time - 60;
      qntgemas = (time/6)+20;
      qntgemas.toStringAsFixed(0);
    }
    print(qntgemas.toStringAsFixed(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gema Clash'),
        backgroundColor: Colors.lightGreenAccent[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Horas',
            ),
            controller: horas,
          ),
          TextField(
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Minutos',
            ),
            controller: minutos,
          ),
          Container(
            padding: EdgeInsets.only(top:20),
            height: 100,
            child: RaisedButton(
              onPressed: () {calculate();},
              color: Colors.lightGreenAccent[700],
              child: Text(
                "Calcular",
                style: TextStyle(fontSize: 25, color: Colors.blueAccent[700]),
              ),
            ),
          ),
          Container(
            child: Text(
              qntgemas.toStringAsFixed(0) + " gemas",
              style: TextStyle(fontSize: 30, color: Colors.blueAccent[700]),
            ),
          ),
        ],
      ),
    );
  }
}
