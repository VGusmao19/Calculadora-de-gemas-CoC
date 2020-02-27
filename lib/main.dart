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
  TextEditingController minutosController = TextEditingController();
  double qnt_gemas;

  void calculate(){
    double time = double.parse(horas.text)*60;
    setState(() {
      if(time < 60){
      qnt_gemas = time/3;
    }else{
      time = time - 60;
      qnt_gemas = (time/6)+20;
    }
    print(qnt_gemas);
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
            controller: minutosController,
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
              qnt_gemas.toString(),
              style: TextStyle(fontSize: 25, color: Colors.blueAccent[700]),
            )
          )
        ],
      ),
    );
  }
}
