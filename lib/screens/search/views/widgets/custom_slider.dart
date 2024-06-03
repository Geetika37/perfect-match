import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _sliderValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: const Color(0xffF05E87),
        inactiveTrackColor: Colors.grey,
        trackHeight: 4.0,
        thumbColor: const Color(0xffF05E87),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 12.0,
        ),
        overlayColor: const Color(0xffF05E87),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
      child: Slider(
          value: _sliderValue,
          onChanged: (newValue) {
            
            setState(() {
              
              _sliderValue = newValue;
            });
          }),
    );
  }
}
