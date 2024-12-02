import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/color.dart';
import 'custom_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  String SelectedColor = categoryColor.first;
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  String? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 600,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _Time(
                  onStartSave: onStartSave,
                  onEndSave: onEndSave,
                  onStartVaildate: onStartValidate,
                  onEndValidate: onEndValidate,
                ),
                SizedBox(
                  height: 8,
                ),
                _Content(
                  onSave: onContentSave,
                  onValidate: onContentValidate,
                ),
                SizedBox(
                  height: 8,
                ),
                _Categories(
                  selectedColor: SelectedColor,
                  onTap: (String color) {
                    setState(() {
                      SelectedColor = color;
                    });
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                _SaveButton(
                  OnPressed: onSavePressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStartSave(String? val) {
    if (val == null) {
      return null;
    }
    startTime = int.parse(val);
  }

  void onEndSave(String? val) {
    if (val == null) {
      return null;
    }
    endTime = int.parse(val);
  }

  String? onStartValidate(String? val) {}

  String? onEndValidate(String? val) {}

  void onContentSave(String? val) {
    if (val == null) {
      return null;
    }
    content = val;
  }

  String? onContentValidate(String? val) {}

  void onSavePressed() {
    formKey.currentState!.save();

    print(startTime);
    print(endTime);
    print(content);
    print(category);
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSave;
  final FormFieldSetter<String> onEndSave;
  final FormFieldValidator<String> onStartVaildate;
  final FormFieldValidator<String> onEndValidate;

  const _Time({
    required this.onStartSave,
    required this.onEndSave,
    required this.onStartVaildate,
    required this.onEndValidate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            onSaved: onStartSave,
            validator: onStartVaildate,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
            onSaved: onEndSave,
            validator: onEndValidate,
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final FormFieldSetter<String> onSave;
  final FormFieldValidator<String> onValidate;

  const _Content({
    required this.onSave,
    required this.onValidate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        expand: true,
        onSaved: onSave,
        validator: onValidate,
      ),
    );
  }
}

typedef OnColorSelected = void Function(String color);

class _Categories extends StatelessWidget {
  final String selectedColor;
  final OnColorSelected onTap;

  const _Categories({
    required this.selectedColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categoryColor
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  onTap(e);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse(
                        'FF$e',
                        radix: 16,
                      ),
                    ),
                    shape: BoxShape.circle,
                    border: selectedColor == e
                        ? Border.all(
                            width: 4.0,
                            color: Colors.black,
                          )
                        : null,
                  ),
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback OnPressed;

  const _SaveButton({
    required this.OnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: OnPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            child: Text("저장"),
          ),
        ),
      ],
    );
  }
}
