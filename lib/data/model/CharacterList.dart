import 'package:rick_morty_flutter_app/data/model/results.dart';

import 'info.dart';

class CharacterList {

  Info info;
  List<Results> results;

	CharacterList.fromJsonMap(Map<String, dynamic> map): 
		info = Info.fromJsonMap(map["info"]),
		results = List<Results>.from(map["results"].map((it) => Results.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['info'] = info == null ? null : info.toJson();
		data['results'] = results != null ? 
			this.results.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
