class WineBy {
  final String tag;
  final String name;

  WineBy({
    required this.tag,
    required this.name,
  });

  factory WineBy.fromJson(Map<String, dynamic> json) {
    return WineBy(
      tag: json['tag'],
      name: json['name'],
    );
  }
  // Method to convert Wine object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'tag': tag,
      'name': name,
    };
  }
}
