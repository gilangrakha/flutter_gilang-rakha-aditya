class MenuItem {
  final int id;
  final String name;
  final String image;

  MenuItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
