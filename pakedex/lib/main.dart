import 'package:flutter/material.dart';
import 'poke.dart';
import 'pokelisto.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String url =
      'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Poke pokemons;

  Color bgColor = Colors.white;
  Future<List<Poke>> _fetchData() async {
    final response = await http.get(MyHomePage.url);
    final decode = json.decode(response.body);
    final data = Poke.fromJson(decode['results']);
    print(data.pokemons);
    setState(() {
      pokemons = data;
    });
  }

  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("P@kedex"),
        centerTitle: true,
      ),
      body: Container(
        child: pokemons == null
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              )
            : ListView(
                children: List.generate(
                    pokemons.pokemons.length,
                    (index) => PokeList(
                          pokeURL: pokemons.pokemons[index].url,
                        )),
              ),
      ),
    );
  }
}
