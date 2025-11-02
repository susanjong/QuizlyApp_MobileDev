import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';

class AnswerOptionList extends StatelessWidget {
  final List<Answer> answers;
  final String? selectedAnswerId;
  final Function(String) onAnswerSelected;

  const AnswerOptionList({
    super.key,
    required this.answers,
    this.selectedAnswerId,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answers.length,
      itemBuilder: (context, index) {
        final answer = answers[index];
        final isSelected = selectedAnswerId == answer.id;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _AnswerOption(
            answer: answer,
            label: String.fromCharCode(65 + index), // A, B, C, D
            isSelected: isSelected,
            onTap: () => onAnswerSelected(answer.id),
          ),
        );
      },
    );
  }
}

class _AnswerOption extends StatelessWidget {
  final Answer answer;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _AnswerOption({
    required this.answer,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x80FFBBBE): Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFFDD84A1) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFDD84A1) : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFFFBBBE) : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                answer.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? const Color(0xFF484343) : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}