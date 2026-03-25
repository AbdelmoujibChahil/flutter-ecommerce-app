import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/utils/colors.dart';

class ElementsbarComponent extends StatelessWidget {
  final List list;
  final int selectedIndex;
  final Function(int) onSelect;

  const ElementsbarComponent({
    super.key,
    required this.list,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return
    Expanded(child:
       SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final cat = list[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  backgroundColor:
                      isSelected ? mainColor : Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected
                          ? mainColor
                          : Colors.grey.shade300,
                          width: 2,
                    ),
                  ),
                ),
                onPressed: () => onSelect(index),
                child: Text(
                  cat.nom,
                  style: TextStyle(
                    color:
                        isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    )
    );
   
  }
}