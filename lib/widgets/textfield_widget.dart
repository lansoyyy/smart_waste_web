import 'package:flutter/material.dart';
import 'package:smart_waste_web/utlis/colors.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hint;
  final String? label;
  bool? isObscure;
  final TextEditingController controller;
  final double? width;
  final IconData? prefixIcon;
  final double? height;
  final int? maxLine;
  final TextInputType? inputType;
  late bool? showEye;
  late Color? color;
  late Color? borderColor;
  late Color? hintColor;
  late double? radius;
  final String? Function(String?)? validator; // Add validator parameter
  bool? isEnabled;
  final TextCapitalization? textCapitalization;
  final FontStyle? fontStyle;
  final String? errorText;
  final bool? isRequred;
  bool? showErrorMsg;

  TextFieldWidget(
      {super.key,
      this.hint = '',
      this.isRequred = true,
      this.fontStyle = FontStyle.italic,
      this.label,
      this.prefixIcon,
      required this.controller,
      this.isObscure = false,
      this.width = 275,
      this.height = 50,
      this.maxLine = 1,
      this.hintColor = Colors.white,
      this.borderColor = const Color(0xff1A1851),
      this.showEye = false,
      this.color = Colors.white,
      this.radius = 5,
      this.textCapitalization = TextCapitalization.sentences,
      this.inputType = TextInputType.text,
      this.validator,
      this.errorText,
      this.showErrorMsg = true,
      this.isEnabled = true // Add validator parameter
      });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Bold',
                  color: primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              widget.isRequred!
                  ? const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const TextSpan(
                      text: '',
                      style: TextStyle(
                        fontSize: 0,
                        fontFamily: 'Bold',
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(
            enabled: widget.isEnabled,
            style: TextStyle(
              fontFamily: 'Regular',
              fontSize: 14,
              color: primary,
            ),
            textCapitalization: widget.textCapitalization!,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: grey.withOpacity(0.2),
              suffixIcon: widget.showEye! == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isObscure = !widget.isObscure!;
                        });
                      },
                      icon: widget.isObscure!
                          ? Icon(
                              Icons.visibility,
                              color: primary,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: primary,
                            ))
                  : const SizedBox(),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              hintStyle: TextStyle(
                fontStyle: widget.fontStyle!,
                fontFamily: 'Regular',
                fontSize: 14,
                color: primary,
              ),
              hintText: widget.hint,
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor!,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor!,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor!,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
              errorText: widget.errorText,
              errorStyle: TextStyle(
                  fontFamily: 'Bold',
                  fontSize: widget.showErrorMsg! ? widget.radius! : 0.1),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
            ),

            maxLines: widget.maxLine,
            obscureText: widget.isObscure!,
            controller: widget.controller,
            validator:
                widget.validator, // Pass the validator to the TextFormField
          ),
        ),
      ],
    );
  }
}
