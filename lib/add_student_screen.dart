import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  final String? studentId; // For identifying the student to update
  final Map<String, String>? studentData; // Existing data for the student

  const AddStudentScreen({Key? key, this.studentId, this.studentData}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing data if editing
    if (widget.studentData != null) {
      nameController.text = widget.studentData!['name'] ?? '';
      phoneController.text = widget.studentData!['phone'] ?? '';
      emailController.text = widget.studentData!['email'] ?? '';
      locationController.text = widget.studentData!['location'] ?? '';
    }
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _saveStudent() {
    if (_formKey.currentState?.validate() ?? false) {
      final newStudent = {
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'location': locationController.text,
      };

      if (widget.studentId != null) {
        // Logic to update student in database
        print('Updating student with ID ${widget.studentId}');
        print('Updated Data: $newStudent');
      } else {
        // Logic to add new student to database
        print('Adding new student');
        print('Student Data: $newStudent');
      }

      Navigator.pop(context); // Return to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.studentId == null ? 'Add Student Info' : 'Edit Student Info',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFC08552),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFC08552).withOpacity(0.5),
              Color(0xFF5D2A42),
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
                _buildGradientButton(
                  widget.studentId == null ? 'Add Student' : 'Save Changes',
                  _saveStudent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildGradientButton(String text, Function onPressed) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF5D2A42),
              Color(0xFFC08552),
              Color(0xFF5D2A42),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
            style: BorderStyle.solid,
            color: Colors.black,
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
