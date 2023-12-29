import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget{
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {

  int clickCounter = 0;
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Contador Functions'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',style: const TextStyle(fontSize: 160,fontWeight: FontWeight.w100)),
            Text(clickCounter == 1 ? 'click':'clicks',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w100))
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           CustomButton(
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
            icon: Icons.refresh_rounded,
        ),

        const SizedBox(height: 15),
          CustomButton(
            onPressed: () {
              setState(() {
                clickCounter ++;
              });
            },
            icon:Icons.plus_one,
        ),

        const SizedBox(height: 15),

        CustomButton(
          icon:Icons.exposure_minus_1_outlined,
          onPressed: (){
            setState(() {
              if(clickCounter == 0) return;
                clickCounter --;
              });
          },
          ),
        ],
      )
    );
  }
}

class CustomButton extends StatelessWidget {

final IconData icon;
final VoidCallback? onPressed ;

  const CustomButton({
    super.key, required this.icon, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      shape: const StadiumBorder(),
        onPressed: onPressed,
        child: Icon(icon),
    );
  }
}
