import 'dart:convert' show jsonDecode;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'show_profile.dart'; // Import show profile screen

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String? _token;
  String? _username;
  String? _userEmail;
  int? _userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Image.asset(
                  'images/logologin.png', // Ganti dengan path gambar Anda
                  width: 150,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      var url = Uri.parse('https://mobileapis.manpits.xyz/api/login');
                      var request = http.MultipartRequest('POST', url);
                      request.fields.addAll({
                        'email': _email,
                        'password': _password,
                      });

                      var response = await request.send();

                      if (response.statusCode == 200) {
                        var responseBody = await response.stream.bytesToString();
                        print(responseBody); // Print response data to debug console
                        var jsonData = jsonDecode(responseBody);
                        var data = jsonData['data'];
                        _token = data['token'];
                        var user = data['user'];
                        _username = user['name'];
                        _userEmail = user['email'];
                        _userId = user['id'];

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Berhasil')),
                        );

                        // Navigate to show profile screen after successful login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ShowProfile(username: _username, email: _userEmail, id: _userId)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login failed')),
                        );
                      }
                    } on SocketException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Network error: ${e.message}')),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Unknown error: $e')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Ubah warna tombol menjadi biru
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
