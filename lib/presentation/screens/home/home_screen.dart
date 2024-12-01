import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/thema_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: themeService.switchTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.devices),
              title: const Text('Platform Channel'),
              subtitle: const Text('Interagir com código nativo'),
              onTap: () => Get.toNamed('/plataform-channel'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Gerenciar Tarefas'),
              subtitle: const Text('Listar, adicionar e editar tarefas'),
              onTap: () => Get.toNamed('/list-task'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
