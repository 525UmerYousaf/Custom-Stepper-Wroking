// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 0;
  // ignore: prefer_final_fields
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUSTOM STEPPER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                StepperComponent(
                  index: 0,
                  currentIndex: _currentIndex,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                StepperComponent(
                  index: 1,
                  currentIndex: _currentIndex,
                  onTap: () {
                    _currentIndex = 2;
                  },
                ),
                StepperComponent(
                  index: 2,
                  currentIndex: _currentIndex,
                  onTap: () {
                    _currentIndex = 3;
                  },
                ),
                StepperComponent(
                  index: 3,
                  currentIndex: _currentIndex,
                  onTap: () {
                    _currentIndex = 4;
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Center(
                  child: Text('Page $index'),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class StepperComponent extends StatelessWidget {
  //  Index define the position of our bubble
  int index;
  //  currentIndex is index that is gonna change on Tap
  int currentIndex;
  VoidCallback onTap;
  StepperComponent({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: (currentIndex == index)
                        ? Colors.orange
                        : Colors.transparent,
                    border: Border.all(color: Colors.orange),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: (currentIndex == index + 1)
                      ? Colors.orange
                      : Colors.black12,
                ),
              ),
            ],
          ),
          Text('Page ${index + 1}'),
        ],
      ),
    );
  }
}
