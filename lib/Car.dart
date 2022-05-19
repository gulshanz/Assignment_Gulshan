class Car {
  String? title;
  String? date;
  String? status;
  String? imagePath;

  Car(this.title, this.date, this.status, this.imagePath);

  Car.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['incident_date'];
    status = json['status'];
    imagePath = json['image_path'];
  }
}
