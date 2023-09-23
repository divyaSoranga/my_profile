import 'package:flutter/material.dart';

import '../homescreen/home_screen.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late String _originalName; // Used to check for unsaved changes
  late UserProfile user;
  @override
  void initState() {
    super.initState();
    UserProfile user = UserProfile(
      name: 'Divya Soranga',
      email: 'dsoranga@gmail.com',
      skills: ['Flutter', 'Dart', 'UI Design'],
      workExperience: [
        'Software Engineer at ABC Inc',
        'UI/UX Designer at XYZ Corp'
      ],
    );
    // Initialize user profile data (replace with your data)

    _originalName = user.name;
  }

  Future<void> _saveChanges() async {
    // Save changes to your database or storage here
    // After successful save, you can reset _originalName to _user.name
    // to mark changes as saved.
    // For simplicity, we won't implement actual saving in this example.
  }

  Future<void> _confirmDiscardChanges(BuildContext context) async {
    if (user.name != _originalName) {
      final confirm = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Discard Changes?'),
            content:
                Text('You have unsaved changes. Do you want to discard them?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Discard changes
                },
                child: Text('Discard'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Stay on the page
                },
                child: Text('Cancel'),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        Navigator.of(context).pop(); // Navigate back
      }
    } else {
      Navigator.of(context).pop(); // No unsaved changes, simply navigate back
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: WillPopScope(
        // WillPopScope intercepts the back button press
        onWillPop: () async {
          _confirmDiscardChanges(context);
          return false; // Prevents automatic pop
        },
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // GestureDetector(
            //   onTap: _updateAvatar,
            //   child: CircleAvatar(
            //     radius: 50,
            //     backgroundImage: AssetImage(_user.avatarUrl),
            //   ),
            // ),
            SizedBox(height: 16),
            _buildEditableField('Name', user.name),
            // Add other editable fields here
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value),
            TextButton(
              onPressed: () {
                // _navigateToEditPage(label);
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ],
    );
  }

  // void _navigateToEditPage(String field) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => EditProfilePage(
  //         user: user,
  //         field: field,
  //       ),
  //     ),
  //   );
  // }
}

class EditProfilePage extends StatefulWidget {
  final UserProfile user;
  final String field;

  EditProfilePage({required this.user, required this.field});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the current value
    if (widget.field == 'Name') {
      _controller.text = widget.user.name;
    } else {
      // Initialize other fields here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.field}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit ${widget.field}'),
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(labelText: widget.field),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveChanges();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges() {
    // Update the user object with the new value
    if (widget.field == 'Name') {
      // widget.user.name = _controller.text;
    } else {
      // Update other fields here
    }
    Navigator.of(context).pop(); // Navigate back to the profile page
  }
}
