class Augmentation {
  String name;
  String rating;
  String entity;
  String note;
  Augmentation(this.name, this.rating, this.entity, this.note);
  Map<String, dynamic> toJson() =>
      {'name': name, 'rating': rating, 'entity': entity, 'note': note};
  Augmentation.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        rating = json['rating'],
        entity = json['entity'],
        note = json['note'];
}