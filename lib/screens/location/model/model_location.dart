class LocationModel {
  final bool status;
  final String data;

  LocationModel({required this.status, required this.data});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      status: json['status'],
      data: json['data'],
    );
  }
}
