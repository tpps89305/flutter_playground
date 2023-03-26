import 'package:flutter/material.dart';
import 'package:flutter_playground/api_service.dart';
import 'package:http/http.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("網路"),
      ),
      body: FutureBuilder<Album>(
        future: ApiService(client: Client()).fetchAlbum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
    
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
