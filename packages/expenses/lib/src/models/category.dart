import 'package:expense_repository/src/entities/entities.dart';

class Category {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String color;

  Category({
    required this.categoryId,
    required this.color,
    required this.icon,
    required this.name,
    required this.totalExpenses,
  });

  static final empty = Category(
    categoryId: "",
    color: '',
    icon: '',
    name: '',
    totalExpenses: 0,
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      color: entity.color,
      icon: entity.icon,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
    );
  }
}
