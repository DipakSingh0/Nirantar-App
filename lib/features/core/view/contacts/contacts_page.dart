// import 'package:flutter/material.dart';
// import 'package:nira/features/core/controller/contacts_controller.dart';

// class ContactsPage extends StatefulWidget {
//   const ContactsPage({super.key});

//   @override
//   State<ContactsPage> createState() => _ContactsPageState();
// }

// class _ContactsPageState extends State<ContactsPage> {
//   late ContactsController _contactsController;

//   @override
//   void initState() {
//     super.initState();
//     _contactsController = ContactsController(
//       nameController: TextEditingController(),
//       phoneController: TextEditingController(),
//       emailController: TextEditingController(), 
//       addressController: TextEditingController(),
//     );
//     _contactsController.loadContacts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       appBar: AppBar(
//         title: Text('Contacts Page', style: theme.textTheme.displayLarge),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 26.0, left: 16, right: 16),
//         child: Column(
//           spacing: 12,
//           children: [
//             // Add Contact Form
//             TextField(
//               controller: _contactsController.nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _contactsController.phoneController,
//               decoration: const InputDecoration(labelText: 'Phone'),
//             ),
//             TextField(
//               controller: _contactsController.emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _contactsController.addressController,
//               decoration: const InputDecoration(labelText: 'Address'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 await _contactsController.addContact(context);
//                 setState(() {});
//               },
//               child: const Text('Add Contact'),
//             ),
//             const SizedBox(height: 24),
//             // Contact List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _contactsController.contacts.length,
//                 itemBuilder: (context, index) {
//                   final contact = _contactsController.contacts[index];
//                   return ListTile(
//                     title: Text(contact.name),
//                     subtitle: Text('${contact.phone} | ${contact.email}'),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.edit),
//                           onPressed: () async {
//                             await _contactsController.editContact(
//                                 contact, context);
//                             setState(() {});
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete),
//                           onPressed: () async {
//                             await _contactsController.deleteContact(contact.id);
//                             setState(() {});
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:nira/features/core/controller/contacts_controller.dart';
import 'package:nira/widgets/my_appbar_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  late ContactsController _contactsController;

  @override
  void initState() {
    super.initState();
    _contactsController = ContactsController(
      nameController: TextEditingController(),
      phoneController: TextEditingController(),
      emailController: TextEditingController(),
      addressController: TextEditingController(),
    );
    _contactsController.loadContacts();
  }

  void _showAddContactDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Contact'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _contactsController.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _contactsController.phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: _contactsController.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _contactsController.addressController,
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
                await _contactsController.addContact(context);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
        appBar: MyAppBar(
        title: 'C O N T A C T S',
        leadingIcon:  Icons.arrow_back,
        onLeadingIconPressed: () => Navigator.pop(context),
        actionIcon: Icons.person_add,
        onActionIconPressed: _showAddContactDialog,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 26.0, left: 16, right: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Contact List
            Expanded(
              child: ListView.builder(
                itemCount: _contactsController.contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contactsController.contacts[index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text('${contact.phone} | ${contact.email}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            await _contactsController.editContact(
                                contact, context);
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            await _contactsController.deleteContact(contact.id);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
