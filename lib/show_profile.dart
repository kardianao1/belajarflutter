import 'package:flutter/material.dart';

class ShowProfile extends StatelessWidget {
  final String? username;
  final String? email;
  final int? id;

  ShowProfile({Key? key, this.username, this.email, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8, // Tambahkan elevasi untuk efek bayangan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.account_circle, size: 50, color: Colors.blue),
                    ),
                    SizedBox(height: 20),
                    Text('Username: ${username ?? 'null'}', style: TextStyle(fontSize: 18, color: Colors.black)),
                    SizedBox(height: 10),
                    Text('Email: ${email ?? 'null'}', style: TextStyle(fontSize: 18, color: Colors.black)),
                    SizedBox(height: 10),
                    Text('ID: ${id ?? 'null'}', style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
