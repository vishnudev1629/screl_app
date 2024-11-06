

import 'package:flutter/material.dart';

class StepPanel extends StatelessWidget {
  final int currentStep;

  const StepPanel({super.key, required this.currentStep});

  Color _getStepBorderColor(int step) {
    return currentStep == step ? const Color(0xffE64A19) : const Color(0xff9E9E9E);
  }

  Color _getStepBackgroundColor(int step) {
    return currentStep == step ? const Color(0xffE64A19) : Colors.transparent;
  }

  String _getStepTitle(int step) {
    switch (step) {
      case 1:
        return "Create New Campaign";
      case 2:
        return "Create New Segment";
      case 3:
        return "Bidding Strategy";
      case 4:
        return "Site Links";
      case 5:
        return "Review Campaign";
      default:
        return "";
    }
  }

  String _getStepSubtitle(int step) {
    switch (step) {
      case 1:
        return "Fill out these details to build your broadcast";
      case 2:
        return "Get full control over your audience.";
      case 3:
        return "Control ad placement and bidding strategy.";
      case 4:
        return "Connect your website and social media.";
      case 5:
        return "Ensure campaign details are correct.";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            for (int step = 1; step <= 5; step++)
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _getStepBackgroundColor(step),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _getStepBorderColor(step),
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$step",
                          style: TextStyle(
                            color: currentStep == step
                                ? const Color(0xffFFFFFF)
                                : _getStepBorderColor(step),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getStepTitle(step),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_getStepSubtitle(step)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            const Spacer(),
            const Text('Need Help?',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
              'Get to know how your campaign\n can reach a wider audience.',
              textAlign: TextAlign.start,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                side: const BorderSide(color: Color(0xff9E9E9E)),
              ),
              child: const Text(
                "Contact",
                style: TextStyle(color: Color(0x8A000000)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
