import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_124230036/models/animal_list.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;
  const DetailPage({super.key, required this.animal});

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
        backgroundColor: const Color.fromARGB(255, 197, 147, 238), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                animal.image,
                height: 350,
              ),
            ),
            const SizedBox(height: 16),
            Text('${animal.name} (${animal.type})',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Weight: ${animal.weight}'),
            const SizedBox(height: 8),
            Text('Habitat:'),
             ...animal.habitat.map((cast) => Text('- $cast')).toList(),
            const SizedBox(height: 8),
            Text('Height: ${animal.height}'),
            const SizedBox(height: 8),
            Text('Activities:'),
            ...animal.activities.map((cast) => Text('- $cast')).toList(),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () => _openUrl(animal.wikipedia),
                child: const Text('Wikipedia'),
            
              ),
            ),
          ],
        ),
      ),
    );
  }
}
