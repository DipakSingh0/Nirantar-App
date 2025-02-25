// dialogbox_widget.dart
import 'package:flutter/material.dart';

class DialogBoxWidget {
  static Future<void> showAddDialog(BuildContext context, VoidCallback onAdd) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        var theme = Theme.of(context);

        return AlertDialog(
          title: Align(
            alignment: Alignment.center,
            child: Text('Add new child', style: theme.textTheme.displayMedium),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField('Ward Number'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                _buildTextField('Bed Number'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                _buildTextField('Admitted Date'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                _buildTextField('Parent Name'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                _buildTextField('Parents Contact'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                _buildTextField('Health Status'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: theme.textTheme.displaySmall,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  onAdd();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      },
    );
  }

  static Future<void> showDeleteDialog(
      BuildContext context, int index, VoidCallback onDelete) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Container'),
          content:
              const Text('Are you sure you want to delete this container?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                onDelete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
