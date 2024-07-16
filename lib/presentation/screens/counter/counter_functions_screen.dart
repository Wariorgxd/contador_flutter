import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter functions'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh_rounded), onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          }),
        ],
      ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
              Text(clickCounter >= 1 ? 'Clicks':'Click', style: const TextStyle(fontSize: 25),),
            ],
          ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                iconButton: Icons.refresh,
                onPress: () => setState(() {
                clickCounter = 0;
              })),

              const SizedBox(height: 10,),

              CustomButton(
                iconButton: Icons.plus_one,
                onPress: () => setState(() {
                  clickCounter++;
                }),
                ),

              const SizedBox(height: 10,),

              CustomButton(
                iconButton: Icons.exposure_minus_1_outlined,
                onPress: () => setState(() {
                  clickCounter == 0 ? clickCounter = 0 : clickCounter--;
                }),
                ),
          ],)
            );
  }
}

class CustomButton extends StatelessWidget {

  final IconData iconButton;
  final VoidCallback? onPress;

  const CustomButton({
    super.key, required this.iconButton, this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: onPress,
      child: Icon(iconButton),
    );
  }
} 