
// import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// class IncubatorSlider extends StatefulWidget {
//   final double initialValue;
//   final double minValue;
//   final double maxValue;
//   final String unit;
//   final String parameterName;
//   final Function(double) onValueChanged;

//   const IncubatorSlider({
//     super.key,
//     required this.initialValue,
//     required this.minValue,
//     required this.maxValue,
//     required this.unit,
//     required this.parameterName,
//     required this.onValueChanged,
//   });

//   @override
//   State<IncubatorSlider> createState() => _IncubatorSliderState();
// }

// class _IncubatorSliderState extends State<IncubatorSlider> {
//   late double _currentValue;

//   @override
//   void initState() {
//     super.initState();
//     _currentValue = widget.initialValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
       
//         Stack(
//           children: [
//             SizedBox(
//               width: 125,
//               height: 105,
//               child: SleekCircularSlider(
//                 min: widget.minValue,
//                 max: widget.maxValue,
//                 initialValue: _currentValue,
//                 appearance: CircularSliderAppearance(
//                   customWidths: CustomSliderWidths(progressBarWidth: 10),
//                   infoProperties: InfoProperties(
//                     bottomLabelText: widget.unit,
//                     mainLabelStyle: TextStyle(
//                       color: Theme.of(context).colorScheme.onSurface,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     modifier: (double value) => value.toInt().toString(),
//                   ),
//                 ),
//                 onChange: (double value) {
//                   setState(() {
//                     _currentValue = value;
//                   });
//                   widget.onValueChanged(value); // Notify parent widget
//                 },
//                 innerWidget: (double value) {
//                   return Center(
//                 child: Text(
//                   "${value.toInt()} ${widget.unit}",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).colorScheme.onSurface,
//                   ),
//                 ),
//               );
//                 },
//               ),
//             ),
//           ],
//         ),
//          Text(
//           widget.parameterName,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class IncubatorSlider extends StatefulWidget {
  final double initialValue;
  final double minValue;
  final double maxValue;
  final String unit;
  final String parameterName;
  final Function(double) onValueChanged;

  const IncubatorSlider({
    super.key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.unit,
    required this.parameterName,
    required this.onValueChanged,
  });

  @override
  State<IncubatorSlider> createState() => _IncubatorSliderState();
}

class _IncubatorSliderState extends State<IncubatorSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 125,
              height: 105,
              child: SleekCircularSlider(
                min: widget.minValue,
                max: widget.maxValue,
                initialValue: _currentValue,
                appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(progressBarWidth: 10),
                  infoProperties: InfoProperties(
                    bottomLabelText: widget.unit,
                    mainLabelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                    modifier: (double value) => value.toInt().toString(),
                  ),
                ),
                onChange: (double value) {
                  setState(() {
                    _currentValue = value;
                  });
                  widget.onValueChanged(value); // Notify parent widget
                },
                innerWidget: (double value) {
                  return Center(
                    child: Text(
                      "${value.toStringAsFixed(1)} ${widget.unit}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Text(
          widget.parameterName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
