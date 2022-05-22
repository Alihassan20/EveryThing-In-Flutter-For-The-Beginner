import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DragArea extends HookWidget {
  final Widget child;

  const DragArea({ Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final position = useState(Offset(100, 100));
    final prevScale = useState(1.0);
    final scale = useState(1.0);
    return GestureDetector(
      onScaleUpdate: (details) => scale.value = prevScale.value * details.scale,
      onScaleEnd: (_) => prevScale.value = scale.value,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(color: Colors.amber.withOpacity(.4))),
          Positioned(
            left: position.value.dx,
            top: position.value.dy,
            child: Draggable(
              maxSimultaneousDrags: 1,
              feedback: Transform.scale(
                scale: scale.value,
                child: child,
              ),
              childWhenDragging: Opacity(
                opacity: .3,
                child: Transform.scale(
                  scale: scale.value,
                  child: child,
                ),
              ),
              onDragEnd: (details) => position.value = details.offset,
              child: Transform.scale(
                scale: scale.value,
                child: child,
              ),
            ),
          )
        ],
      ),
    );
  }
}