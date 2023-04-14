import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:yamagata_map/view_models/home_page.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final List<String> tutorialImages = [
    'assets/images/tutorial1.png',
    'assets/images/tutorial2.png',
    'assets/images/tutorial3.png',
  ];

  final List<String> tutorialTexts = [
    '山形県の美しい風景を楽しむ',
    '地元のグルメを堪能',
    'おすすめ観光ルートを案内',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Expanded(
                  child: Image.asset(tutorialImages[index], fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    tutorialTexts[index],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
          itemCount: tutorialImages.length,
          onIndexChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          right: 16,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('スキップ'),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex != 0
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            currentIndex -= 1;
                          });
                        },
                        child: Text('戻る'),
                      )
                    : SizedBox.shrink(),
                currentIndex != tutorialImages.length - 1
                    ? TextButton(
                        onPressed: () {
                          setState(() {
                            currentIndex += 1;
                          });
                        },
                        child: Text('次へ'),
                      )
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text('完了'),
                      ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
