
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class FlutterDrawingBoard extends StatefulWidget {
  const FlutterDrawingBoard({super.key});

  @override
  State<FlutterDrawingBoard> createState() => _FlutterDrawingBoardState();
}

class _FlutterDrawingBoardState extends State<FlutterDrawingBoard> {
  final DrawingController _drawingController = DrawingController();

  @override
  void dispose() {
    _drawingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Drawing Board
          Expanded(
            child: DrawingBoard(
              controller: _drawingController,
              background: Container(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          ),

          // Action Bar (slider, undo, redo, rotate, clear)
          DrawingBar(
            controller: _drawingController,
            tools: [
              DefaultActionItem.slider(),
              DefaultActionItem.undo(),
              DefaultActionItem.redo(),
              DefaultActionItem.turn(),
              DefaultActionItem.clear(),
            ],
          ),

          // Tool Bar (pen, brush, shapes, eraser)
          DrawingBar(
            controller: _drawingController,
            tools: [
              DefaultToolItem.pen(),
              DefaultToolItem.brush(),
              DefaultToolItem.rectangle(),
              DefaultToolItem.circle(),
              DefaultToolItem.straightLine(),
              DefaultToolItem.eraser(),
            ],
          ),
        ],
      ),
    );
  }
}