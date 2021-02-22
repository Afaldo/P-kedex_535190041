import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Poke {
  List<BasePokemon> pokemons = [];
  Poke.fromJson(List<dynamic> json) {
    if (json == null) return;
    json.forEach((item) {
      final pokemon = BasePokemon.fromJson(item);
      pokemons.add(pokemon);
    }
    );
  }
}

class BasePokemon {
  String name;
  String url;
  BasePokemon({
    this.name,
    this.url,
  }
  );

  factory BasePokemon.fromJson(Map<String, dynamic> json) {
    return BasePokemon(
      name: json["name"],
      url: json["url"],
    );
  }
  Map<String, dynamic> toJson() => {"name": name, "url": url};
}
Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
  int id;
  String name;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;
  int height;

  Pokemon({
    this.id,
    this.name,
    @required this.weight,
    @required this.height,
    this.sprites,
    this.stats,
    this.types,
  }
  );

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        name: json["name"],
        weight: json["weight"],
        height: json["height"],
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        sprites: Sprites.fromJson(json["sprites"]),
      );
}

class Species {
  String name;
  String url;
  Species({
    this.name,
    this.url,
  }
  );

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Sprites {
  String frontDefault;
  Sprites({
    this.frontDefault,
  }
  );

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
      );
  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;
  Stat({
    this.baseStat,
    this.stat,
  }
  );

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        stat: Species.fromJson(json["stat"]),
      );
  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  int slot;
  Species type;
  Type({
    this.slot,
    this.type,
  }
  );

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );
  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
