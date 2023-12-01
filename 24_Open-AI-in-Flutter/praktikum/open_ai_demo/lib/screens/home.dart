import 'package:flutter/material.dart';
import 'package:open_ai_demo/services/recommendation.dart';
import 'package:open_ai_demo/screens/result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        budget: _budgetController.text,
        camera: _cameraController.text,
        capacity: _capacityController.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Smartphone Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                heightFactor: 4,
                child: Text(
                  'Smartphone Recommendation by AI',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Enter your budget : '),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _budgetController,
                  decoration: InputDecoration(hintText: 'Enter your budget'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Enter your camera : '),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _cameraController,
                  decoration: InputDecoration(hintText: 'Enter your camera'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Enter your capacity : '),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _capacityController,
                  decoration: InputDecoration(hintText: 'Enter your capacity'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getRecommendations,
                        child: const Center(
                          child: Text('Get Recommendations'),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
