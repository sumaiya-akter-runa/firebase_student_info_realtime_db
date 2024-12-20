import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  // Declare TextEditingControllers to manage the input values
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  // Declare a GlobalKey for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Save or update student data
  void _saveStudent() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, print the student info (or save it to a database)
      print('Student Name: ${nameController.text}');
      print('Phone: ${phoneController.text}');
      print('Email: ${emailController.text}');
      print('Location: ${locationController.text}');
      // Handle your save or update logic here (e.g., save to a database)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Student Info',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFC08552), // Chocolate color for AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFC08552).withOpacity(0.5), // Tan color (#c08552)
              Color(0xFF5D2A42), // Deep maroon color (#5d2a42)
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(nameController, 'Student Name', Icons.person),
                SizedBox(height: 20),
                _buildTextField(phoneController, 'Phone', Icons.phone),
                SizedBox(height: 20),
                _buildTextField(emailController, 'Email', Icons.email),
                SizedBox(height: 20),
                _buildTextField(locationController, 'Location', Icons.location_on),
                SizedBox(height: 30),
                _buildGradientButton('Save/Update', _saveStudent),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TextField widget with validation
  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  // Gradient button widget
  Widget _buildGradientButton(String text, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5D2A42),
              Color(0xFFC08552), // Tan color (#c08552)
              Color(0xFF5D2A42), // Deep maroon color (#5d2a42)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30), // Rounded corners
          border: Border.all(
            width: 2, // Border width
            style: BorderStyle.solid, // Solid border
            color: Colors.black, // Border color
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.3),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}