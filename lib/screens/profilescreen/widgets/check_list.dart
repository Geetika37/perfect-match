import 'package:flutter/material.dart';

class CheckList extends StatelessWidget {
  final List<String> checkList;
  final List<bool> selected;
  final Function(int, bool?) onChanged;
  final int crossAxisCount;

  const CheckList({
    super.key,
    required this.checkList,
    required this.selected,
    required this.onChanged,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: checkList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 35,
      ),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Checkbox(
              activeColor: Colors.pink,
              checkColor: const Color(0xffF4F4F6),
              value: selected[index],
              side: const BorderSide(color: Colors.pink),
              onChanged: (bool? value) {
                onChanged(index, value);
              },
            ),
            Expanded(
              child: Text(
                checkList[index],
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      },
    );
  }
}
