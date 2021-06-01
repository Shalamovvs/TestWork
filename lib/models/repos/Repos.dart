import 'package:myapp/models/repos/Owner.dart';

class Rep {
  final int id;

  final String name;

  final String url;

  final String? description;

  final Owner owner;

  Rep({required this.id, required this.name, required this.url, required this.description , required this.owner});

  factory Rep.fromMap(Map<String, dynamic> map) {
    return Rep(
      id: map["id"],
      url: map["html_url"],
      name: map["name"],
      description: map["description"],
      owner: Owner.fromMap(map["owner"])
    );
  }
}
