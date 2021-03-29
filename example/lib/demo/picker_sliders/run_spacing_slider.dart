import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../maybe_tooltip.dart';
import '../pods.dart';

@immutable
class RunSpacingSlider extends ConsumerWidget {
  const RunSpacingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaybeTooltip(
      condition: watch(enableTooltipsPod).state,
      tooltip: 'ColorPicker(runSpacing: '
          '${context.read(runSpacingPod).state.floor().toString()})',
      child: ListTile(
        title: const Text('Color picker item run spacing'),
        subtitle: Slider.adaptive(
            max: 25,
            divisions: 25,
            label: context.read(runSpacingPod).state.floor().toString(),
            value: watch(runSpacingPod).state,
            onChanged: (double value) =>
                context.read(runSpacingPod).state = value),
        trailing: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Text(
                'dp',
                style: TextStyle(fontSize: 11),
              ),
              Text(
                context.read(runSpacingPod).state.floor().toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
