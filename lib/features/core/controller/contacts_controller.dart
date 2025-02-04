
import 'package:nira/imports.dart';

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../model/contacts_model.dart';

class ContactsController {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController addressController;


  List<Contact> contacts = [];

  ContactsController({
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.addressController,

  });

  // Load contacts from SharedPreferences
  Future<void> loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getStringList('contacts') ?? [];
    contacts =
        contactsJson.map((json) => Contact.fromMap(jsonDecode(json))).toList();
  }

  // Save contacts to SharedPreferences
  Future<void> saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson =
        contacts.map((contact) => jsonEncode(contact.toMap())).toList();
    prefs.setStringList('contacts', contactsJson);
  }

  // Add a new contact
  Future<void> addContact(BuildContext context) async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final address = addressController.text.trim();


    if (name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty && address.isNotEmpty) {
      final newContact = Contact(
        id: DateTime.now().toString(),
        name: name,
        phone: phone,
        email: email,
        address: address ,
      );
      contacts.add(newContact);
      await saveContacts();
      clearForm();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
    }
  }

  // Edit an existing contact
  Future<void> editContact(Contact contact, BuildContext context) async {
    nameController.text = contact.name;
    phoneController.text = contact.phone;
    emailController.text = contact.email;
    addressController.text = contact.address;


    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
                TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final phone = phoneController.text.trim();
                final email = emailController.text.trim();
                final address = addressController.text.trim();


                if (name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty) {
                  contact.name = name;
                  contact.phone = phone;
                  contact.email = email;
                  contact.address = address;

                  await saveContacts();
                  clearForm();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields.')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Delete a contact
  Future<void> deleteContact(String id) async {
    contacts.removeWhere((c) => c.id == id);
    await saveContacts();
  }

  // Clear the form fields
  void clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
  }
}





// class ContactsController with ChangeNotifier {
//   List<Contact> _contacts = [];

//   List<Contact> get contacts => _contacts;

//   // Load contacts from SharedPreferences
//   Future<void> loadContacts() async {
//     final prefs = await SharedPreferences.getInstance();
//     final contactsJson = prefs.getStringList('contacts') ?? [];
//     _contacts = contactsJson.map((json) => Contact.fromMap(json as Map<String, dynamic>)).toList();
//     notifyListeners();
//   }

//   // Save contacts to SharedPreferences
//   Future<void> _saveContacts() async {
//     final prefs = await SharedPreferences.getInstance();
//     final contactsJson = _contacts.map((contact) => contact.toMap()).toList();
//     prefs.setStringList('contacts', contactsJson.cast<String>());
//   }

//   // Add a new contact
//   Future<void> addContact(Contact contact) async {
//     _contacts.add(contact);
//     await _saveContacts();
//     notifyListeners();
//   }

//   // Edit an existing contact
//   Future<void> editContact(
//       String id, String name, String phone, String email) async {
//     final contact = _contacts.firstWhere((c) => c.id == id);
//     contact.name = name;
//     contact.phone = phone;
//     contact.email = email;
//     await _saveContacts();
//     notifyListeners();
//   }

//   // Delete a contact
//   Future<void> deleteContact(String id) async {
//     _contacts.removeWhere((c) => c.id == id);
//     await _saveContacts();
//     notifyListeners();
//   }
// }

