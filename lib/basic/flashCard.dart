import 'package:flutter/material.dart';

void main() {
  runApp(FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashcardScreen(),
    );
  }
}

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  List<Map<String, String>> flashcards = [
    {
      'question': 'What is the capital of France?',
      'answer': 'Paris',
    },
    {
      'question': 'What is 2 + 2?',
      'answer': '4',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answer': 'Jupiter',
    },
  ];

  int currentCardIndex = 0;

  void showNextCard() {
    setState(() {
      currentCardIndex = (currentCardIndex + 1) % flashcards.length;
    });
  }

  void showPreviousCard() {
    setState(() {
      currentCardIndex =
          (currentCardIndex - 1 + flashcards.length) % flashcards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showNextCard();
                });
              },
              child: Flashcard(
                question: flashcards[currentCardIndex]['question'],
                answer: flashcards[currentCardIndex]['answer'],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showPreviousCard();
                    });
                  },
                  child: const Text('Previous'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showNextCard();
                    });
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Flashcard extends StatefulWidget {
  final String? question;
  final String? answer;

  const Flashcard({super.key, required this.question, required this.answer});

  @override
  _FlashcardState createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  bool showAnswer = false;

  void toggleCard() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          toggleCard();
        },
        child: Center(
          child: Text(
            showAnswer
                ? widget.answer ?? "No answer"
                : widget.question ?? "No question",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
