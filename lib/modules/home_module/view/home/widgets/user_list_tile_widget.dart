import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class UserListTileWidget extends StatelessWidget {
  const UserListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        maxRadius: 18,
        backgroundImage: AssetImage('assets/images/minha_veidinha.jpg'),
      ),
      title: Text(
        'Olá, Veida Cardoso',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        'Bem vinda de volta!',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          color: Color(0xff8F95A3),
        ),
      ),
      trailing: Icon(
        UniconsLine.bell,
        color: Colors.white,
      ),
    );
  }
}
