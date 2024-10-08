class BrowseResponse {
  BrowseResponse(
      {this.genres, this.success, this.statusMessage, this.statusCode});

  BrowseResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Category.fromJson(v));
      });
    }
  }

  List<Category>? genres;
  int? statusCode;
  String? statusMessage;
  String? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.name,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
