class DogModel {
  String imageUrl;
  String status;

  DogModel({
    required this.imageUrl,
    required this.status
  });

  factory DogModel.fromJson(Map<String,dynamic> json) => DogModel(
    imageUrl: json["message"],
    status: json["status"],
  );
}