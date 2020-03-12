import 'package:rick_morty_flutter_app/data/model/location.dart';

import 'origin.dart';

class Results {

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  String created;

	Results.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		status = map["status"],
		species = map["species"],
		type = map["type"],
		gender = map["gender"],
		origin = Origin.fromJsonMap(map["origin"]),
		location = Location.fromJsonMap(map["location"]),
		image = map["image"],
		episode = List<String>.from(map["episode"]),
		url = map["url"],
		created = map["created"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['status'] = status;
		data['species'] = species;
		data['type'] = type;
		data['gender'] = gender;
		data['origin'] = origin == null ? null : origin.toJson();
		data['location'] = location == null ? null : location.toJson();
		data['image'] = image;
		data['episode'] = episode;
		data['url'] = url;
		data['created'] = created;
		return data;
	}
}
