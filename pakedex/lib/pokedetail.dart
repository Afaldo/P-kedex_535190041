import 'package:flutter/material.dart';
import 'poke.dart';

class DetailPage extends StatelessWidget {
 @immutable
  Pokemon pokepoke;

  Color bgColor = Colors.white;
  DetailPage(this.pokepoke);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("P@kedex",
        style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pokepoke == null
                ? Center(
                    child: Text('NaN'),
                  )
                : Center(
                    child: Text(
                    'ID: ${pokepoke.id.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  )
                ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.zero, bottom: Radius.zero)
                        ),
              ),
              Image(
                image: NetworkImage(pokepoke.sprites.frontDefault),
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            pokepoke.name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.black,
                letterSpacing: 3),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: -1,
            child: Container(
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pokepoke.types.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      margin:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                      child: Text(
                        pokepoke.types[index].type.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            letterSpacing: 2),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(30)),
                    );
                  }
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('${pokepoke.weight * 10} Gr',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      )
                      ),
                  Text('Weight',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.black)),
                ],
              ),
              Column(
                children: [
                  Text('${pokepoke.height * 10} CM',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      )
                      ),
                  Text('Height',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.black,
                      )
                      ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Text(
            "Stats",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.underline,
                letterSpacing: 2),
          )
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: pokepoke.stats.length,
                itemBuilder: (context, index) {
                  final poke = pokepoke.stats[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(110,0,0,0),
                    child: Row(
                    children: [
                      Text(
                        '${poke.stat.name} = ${poke.baseStat}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 3,
                      )
                    ],
                    )
                  );
                }
                ),
          )
        ],
      ),
    );
  }
}
