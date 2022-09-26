import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyphi/utils/SizeConfig.dart';

class CustomTextField extends StatefulWidget {
  String? label;
  String? hint;
  IconData? icon;
  TextInputType? textInputType;
  bool? tooltipActive;
  String? tooltipMessage;
  TextEditingController? controller;
  TextCapitalization? textCapitalization;
  int? maxLength;
  ValueChanged onChange;
  bool? obsecurePassword;
  String? Function(String?)? validator;

  List<TextInputFormatter>? textInputFormatter;

  CustomTextField(
      {this.label,
      this.hint,
      this.icon,
      this.textInputType,
      this.tooltipActive,
      this.tooltipMessage,
      this.controller,
      this.textCapitalization,
      this.maxLength,
      required this.onChange,
      this.textInputFormatter,
      this.obsecurePassword,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.headline3?.color,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Visibility(
              visible: widget.tooltipActive ?? false,
              child: Tooltip(
                message: widget.tooltipMessage ?? '',
                height: 300,
                child: Icon(
                  Icons.help,
                  size: 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 12,
          alignment: Alignment.center,
          child: TextFormField(
            validator: widget.validator != null
                ? widget.validator
                : (text) {
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    if (text.length < 4) {
                      return 'Too short';
                    }
                    return null;
                  },
            // inputFormatters: widget.textInputFormatter ??
            //     [
            //       FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$')),
            //     ],

            obscureText: widget.obsecurePassword ?? false,
            onChanged: widget.onChange,
            controller: widget.controller,
            keyboardType: widget.textInputType ?? TextInputType.text,
            textAlign: TextAlign.start,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.words,
            maxLength: widget.maxLength ?? 20,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: widget.hint,
            ),
          ),
        ),
      ],
    );
  }
}
