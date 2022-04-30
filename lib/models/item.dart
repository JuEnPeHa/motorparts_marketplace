class Item {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final int stock;
  final String category;
  final String subcategory;
  final String brand;
  final String size;
  final String color;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.stock,
    required this.category,
    required this.subcategory,
    required this.brand,
    required this.size,
    required this.color,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: json['images'],
      price: json['price'],
      stock: json['stock'],
      category: json['category'],
      subcategory: json['subcategory'],
      brand: json['brand'],
      size: json['size'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'price': price,
      'stock': stock,
      'category': category,
      'subcategory': subcategory,
      'brand': brand,
      'size': size,
      'color': color,
    };
  }

  @override
  String toString() {
    return 'Item{id: $id, name: $name, description: $description, images: $images, price: $price, stock: $stock, category: $category, subcategory: $subcategory, brand: $brand, size: $size, color: $color}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          images == other.images &&
          price == other.price &&
          stock == other.stock &&
          category == other.category &&
          subcategory == other.subcategory &&
          brand == other.brand &&
          size == other.size &&
          color == other.color;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      images.hashCode ^
      price.hashCode ^
      stock.hashCode ^
      category.hashCode ^
      subcategory.hashCode ^
      brand.hashCode ^
      size.hashCode ^
      color.hashCode;
}

class ItemInCart {
  final String id;
  final String name;
  final String image;
  final double price;
  int quantity;
  final int index;

  ItemInCart({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.index,
  });

  factory ItemInCart.fromJson(Map<String, dynamic> json) {
    return ItemInCart(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'index': index,
    };
  }

  @override
  String toString() {
    return 'ItemInCart{id: $id, name: $name, image: $image, price: $price, quantity: $quantity, index: $index}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemInCart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          image == other.image &&
          price == other.price &&
          quantity == other.quantity &&
          index == other.index;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      price.hashCode ^
      quantity.hashCode ^
      index.hashCode;
}
