import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class ProfilePage extends StatelessWidget {
  final LocalStorage storage = LocalStorage('localstorage_app');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          storage.deleteItem('info');
        },
        child: Icon(Icons.close),
      ),
    );
  }
}
