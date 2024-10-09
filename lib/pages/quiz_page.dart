import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {

  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    String topic = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(), // Kosong untuk bagian kiri
          Text("1/10", style: TextStyle(color: Colors.white),), // Teks di tengah
          Text(topic, style: TextStyle(color: Colors.white),), // Teks di kanan
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 82, 83, 94),
          iconTheme: const IconThemeData(
          color: Colors.white, // Warna ikon
        ),
      ),
      backgroundColor: Color.fromARGB(255, 58, 58, 71),
      // body: Column(
      //   children: [
      //     Row(
      //         children: [
      //           Icon(Icons.arrow_back_rounded, color: Colors.white, size: 50,)
      //         ],
      //     )
      //   ],
      // ),
    );
  }
}