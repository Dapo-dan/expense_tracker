class CategoryEntity {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String color;

  CategoryEntity({
    required this.categoryId,
    required this.color,
    required this.icon,
    required this.name,
    required this.totalExpenses,
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'color': color,
      'icon': icon,
      'totalExpenses': totalExpenses,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'],
      color: doc['color'],
      icon: doc['icon'],
      name: doc['name'],
      totalExpenses: doc['totalExpenses'],
    );
  }
}
