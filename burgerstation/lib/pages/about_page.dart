import 'package:burgerstation/data/page_data.dart';
import 'package:flutter/material.dart';


class AboutPage extends StatelessWidget {
  
final PageData pageData;
  const AboutPage({Key? key, required this.pageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageData.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pageData.description,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to previous screen
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}