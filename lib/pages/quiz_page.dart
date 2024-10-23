import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class QuizPage extends StatefulWidget {

  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordSpoken = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      
    });
  }
  
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    setState(() {
      _wordSpoken = result.recognizedWords;
    });
  }

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

      body: Column(
        children: [
          Spacer(),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 341,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 154, 104),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            child: Column(
              children: [
                Text(
                  _speechToText.isListening 
                    ? "Listening..." 
                      : _speechEnabled 
                        ? "Tap the microphone to start listening..." 
                          : "Speech not available",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _wordSpoken
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: FloatingActionButton(
                        onPressed: _speechToText.isListening ? _stopListening : _startListening,
                        tooltip: "Listen",
                        backgroundColor: const Color.fromARGB(255, 58, 58, 71),
                        child: Icon(
                          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
                          color: Colors.white,
                          size: 50,
                        ),
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}