import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView Example: Karime Alejandra Caballero Campos'),
        backgroundColor: Color.fromARGB(255, 142, 10, 179), // Color del app bar
      ),
      body: items != null
          ? ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5.0,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  color: Color.fromARGB(255, 128, 50, 115), // Color del card
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(
                      items[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black, // Color del texto del título
                      ),
                    ),
                    subtitle: Text(
                      'ID: ${items[index].id}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 241, 239,
                            239), // Color del texto del subtítulo
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Muestra un indicador de carga mientras se cargan los elementos
            ),
    );
  }
}
