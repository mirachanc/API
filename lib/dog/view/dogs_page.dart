import 'package:dogs/dog/controller/dog_controller.dart';
import 'package:flutter/material.dart';

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> implements DogDelegate {
  final DogController _controller = DogController();

  @override
  void initState() {
    super.initState();
    _controller.delegate = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              _controller.image,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (imgContext,obj,trace){
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey.shade200,
                );
              },
            ),
          ),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: (){
              _controller.getDogImage();
            },
            child: const Text("Yenile"),
          ),
        ],
      ),
    );
  }

  @override
  void notify(DogResults result) {
    switch(result){
      case DogResults.refresh:
        setState(() {});
        break;
      case DogResults.error:
        break;
    }
  }
}
