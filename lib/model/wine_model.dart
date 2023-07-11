class Wine {
  String? title;
  String? price;
  String? details;

  Wine({
    this.title,
    this.price,
    this.details,
  });

  Wine.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['details'] = details;
    return data;
  }
}
