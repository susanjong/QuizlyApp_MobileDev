import 'package:flutter/material.dart';
import 'dart:async';

class QuizHeader extends StatefulWidget {
  final String title;
  final int timeInMinutes;
  final VoidCallback onTimeUp;
  final VoidCallback onBackPressed;

  const QuizHeader({
    super.key,
    required this.title,
    required this.timeInMinutes,
    required this.onTimeUp,
    required this.onBackPressed,
  });

  @override
  State<QuizHeader> createState() => _QuizHeaderState();
}

class _QuizHeaderState extends State<QuizHeader> {
  late Timer _timer;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.timeInMinutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
        widget.onTimeUp();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFFDD84A1),
            const Color(0xFFFFBB00BE),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: widget.onBackPressed,
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            _TimerBox(minutes: minutes, seconds: seconds),
          ],
        ),
      ),
    );
  }
}

class _TimerBox extends StatelessWidget {
  final int minutes;
  final int seconds;

  const _TimerBox({
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TimeDigit(value: minutes),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            ':',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        _TimeDigit(value: seconds),
      ],
    );
  }
}

class _TimeDigit extends StatelessWidget {
  final int value;

  const _TimeDigit({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value.toString().padLeft(2, '0'),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}