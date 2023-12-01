import 'package:flutter/material.dart';
import 'package:open_ai_demo/models/open_ai.dart';

class ResultScreen extends StatelessWidget{
  final GptData gptResponseData;

  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendation'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(16)),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              gptResponseData.choices[0].text,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}