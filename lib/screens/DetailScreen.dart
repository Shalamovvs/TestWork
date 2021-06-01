import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final String? imageUrl;
  final String repUrl;
  final String login;

  DetailScreen({this.imageUrl, required this.repUrl, required this.login});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                  child: Image(image: NetworkImage(imageUrl!))
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text('$login', style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              GestureDetector(
                onTap: () {
                  launch('$repUrl');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('$repUrl', style: TextStyle(color: Colors.blue[800], decoration: TextDecoration.underline)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Share.share('$repUrl');
                }, 
                child: Text('Отправить друзьям')
              )
            ],
          ),
        ),
      ),
    );
  }
}
