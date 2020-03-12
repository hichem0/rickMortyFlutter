
class Info {

  int count;
  int pages;
  String next;
  String prev;

	Info.fromJsonMap(Map<String, dynamic> map): 
		count = map["count"],
		pages = map["pages"],
		next = map["next"],
		prev = map["prev"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['count'] = count;
		data['pages'] = pages;
		data['next'] = next;
		data['prev'] = prev;
		return data;
	}
}
