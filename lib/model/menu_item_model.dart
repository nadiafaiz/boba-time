class MenuItemModel {
  final String name;
  final String thumbnail;

  MenuItemModel({required this.name, required this.thumbnail});

  factory MenuItemModel.fromMap(map) {
    return MenuItemModel(
      name: map['name'],
      thumbnail: map['thumbnail'],
    );
  }
}
