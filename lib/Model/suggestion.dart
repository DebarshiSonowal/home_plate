class Suggestion {
  final String placeId;
  final String description;
  String? streetNumber;
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  double? latitude,longitude;
  Suggestion({
    required this.placeId,
    required this.description,
  });

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}