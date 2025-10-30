import 'package:flutter/material.dart';

class DoubtCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const DoubtCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isChecked ? Colors.orange : Colors.grey.shade300,
            width: isChecked ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isChecked ? Colors.orange : Colors.grey.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isChecked ? Colors.orange : Colors.white,
              ),
              child: isChecked
                  ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              'Ragu-ragu',
              style: TextStyle(
                fontSize: 14,
                fontWeight: isChecked ? FontWeight.w600 : FontWeight.w500,
                color: isChecked ? Colors.orange : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}