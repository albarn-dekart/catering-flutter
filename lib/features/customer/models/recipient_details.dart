class RecipientDetails {
  final int id;
  final String firstName;
  final String secondName;
  final String city;
  final String postCode;
  final String phoneNumber;
  final String address;

  RecipientDetails({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.city,
    required this.postCode,
    required this.phoneNumber,
    required this.address,
  });

  factory RecipientDetails.fromJson(Map<String, dynamic> json) {
    return RecipientDetails(
      id: json['id'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      city: json['city'],
      postCode: json['postCode'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'city': city,
      'postCode': postCode,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}