import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const Row(
              children: [
                Text("Discover",style: TextStyle(fontSize:30,height:3,
                fontWeight: FontWeight.w700)),

              ],
            ),
          const SizedBox(height: 30,
          ),
            Row(
             children: [
              ElevatedButton(onPressed: (){}, child: const Text("All")),
            const  SizedBox(width: 30,),
               ElevatedButton(onPressed: () {}, child: const Text("Free")),
               const SizedBox(width: 30,),
                ElevatedButton(onPressed: () {}, child: const Text("Paid")),

             ],
            )
          ],
        ),
      ),
    );
  }
}
