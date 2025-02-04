class Contact {
  final String id;
  String name;
  String phone;
  String email;
  String address;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  // Convert a Contact to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  // Create a Contact from a Map
  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
    );
  }
}
