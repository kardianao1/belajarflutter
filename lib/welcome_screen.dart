import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Tambahkan gambar di sini
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'images/homepage1.png', // Ganti dengan path gambar Anda
                width: 250,
              ),
            ),
            Text(
              'Welcome To My App',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Ubah warna tombol menjadi biru
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
              ),
            ),
            SizedBox(height: 10.0),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue), // Garis pinggir warna biru
              ),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
