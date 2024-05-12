import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_colors.dart';

import '../utils/app_spaces.dart';

class AppTextFieldWidget extends StatefulWidget {
  Color? cursorColor;
  bool? obscureText = false;
  IconData? prefixIcon;
  bool? filled = true;
  Color? fillColor = Colors.white;
  String? levelText;
  Color? levelColor = const Color(0xff244562);
  Color? border_color = const Color(0xff244562);
  Color? focus_border_color = const Color(0xff244562);
  Function(String)? onSave;
  double? horizontal_pading = 10;
  double? vartical_pading = 0;
  String? hint;
  double? padding = 16.0;
  double? padding_right;
  double? padding_left;
  double? width;
  double? height;
  bool? enable = true;
  int? maxLines = 1;
  int? minLines = 1;
  int? maxLength;
  TextStyle? textStyle;
  TextEditingController? controller;
  bool? isDropDown = false;
  Function(String)? selectedDropDownMenuFn;
  String? selectedDropDownMenu = "";
  List<String>? dropDownMenus;
  String? selectedDropDownValue;
  Function(String)? onValue;
  bool? isMask = true;
  TextInputType? textInputType ;


  AppTextFieldWidget({this.obscureText,this.height,this.width,this.padding,this.border_color,this.controller,this.cursorColor,this.dropDownMenus,this.enable,this.fillColor,this.filled,this.focus_border_color,this.hint,this.horizontal_pading,this.isDropDown,this.isMask,this.levelColor,this.levelText,this.maxLength,this.maxLines,this.minLines ,this.onSave,this.onValue,this.padding_left,this.padding_right,this.prefixIcon,this.selectedDropDownMenu,this.selectedDropDownMenuFn,this.selectedDropDownValue,this.textInputType,this.textStyle,this.vartical_pading});

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {


  bool? _isObscord = true;
  @override
  Widget build(BuildContext context) {
    return _AppTextFieldWidget(textInputType: widget.textInputType =  TextInputType.text,textStyle: widget.textStyle,controller: widget.controller,cursorColor: widget.cursorColor,border_color: widget.border_color,dropDownMenus: widget.dropDownMenus,enable: widget.enable,fillColor: widget.fillColor,filled: widget.filled,focus_border_color: widget.focus_border_color,height: widget.height,hint: widget.hint,horizontal_pading: widget.horizontal_pading,padding: widget.padding,padding_left: widget.padding_left,padding_right: widget.padding_right,prefixIcon: widget.prefixIcon,selectedDropDownMenu: widget.selectedDropDownMenu,selectedDropDownValue: widget.selectedDropDownValue,selectedDropDownMenuFn: widget.selectedDropDownMenuFn,maxLength: widget.maxLines,maxLines: widget.minLines??1,minLines: widget.minLines,obscureText: widget.obscureText,onSave: widget.onSave,onValue: widget.onValue,vartical_pading: widget.vartical_pading,isDropDown: widget.isDropDown,isMask: widget.isMask,width: widget.width,levelColor: widget.levelColor,levelText: widget.levelText,);
  }


  Widget _AppTextFieldWidget(
      {Color? cursorColor = Colors.black,
        bool? obscureText = false,
        IconData? prefixIcon,
        bool? filled = true,
        Color? fillColor = Colors.white,
        String? levelText,
        Color? levelColor = const Color(0xff244562),
        Color? border_color = const Color(0xff244562),
        Color? focus_border_color = const Color(0xff244562),
        Function(String)? onSave,
        double? horizontal_pading = 10,
        double? vartical_pading = 0,
        String? hint,
        double? padding = 16.0,
        double? padding_right,
        double? padding_left,
        double? width,
        double? height,
        bool? enable = true,
        int maxLines = 1,
        int? minLines = 1,
        int? maxLength,
        TextStyle? textStyle,
        TextEditingController? controller,
        bool? isDropDown = false,
        Function(String)? selectedDropDownMenuFn,
        String? selectedDropDownMenu = "",
        List<String>? dropDownMenus,
        String? selectedDropDownValue,
        Function(String)? onValue,
        bool? isMask = true,
        TextInputType? textInputType = TextInputType.text}) =>
      Container(
        color: maxLines != null ? fillColor : Colors.transparent,
        height: maxLines != 1 ? maxLines * 24.0 : null,
        padding: EdgeInsets.only(
            left: padding_left ?? 16, right: padding_right ?? 16),
        child: Stack(
          children: [
            TextField(
              onChanged: (v) {
                onValue!(v);
              },
              controller: controller,
              maxLines: maxLines,
              minLines: minLines,
              maxLength: maxLength,
              enabled: enable,
              keyboardType: textInputType,
              cursorColor: cursorColor,
              style: textStyle ?? TextStyle(color: Colors.black),
              obscureText:  obscureText!= null && obscureText == true  ? _isObscord! : false,
              decoration: InputDecoration(
                counterText: "",
                prefixIcon: prefixIcon != null
                    ? Icon(
                  prefixIcon,
                  size: 40,
                )
                    : null,
                filled: filled,
                fillColor: fillColor,
                labelText: levelText,
                hintText: hint,
                labelStyle: TextStyle(color: levelColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: focus_border_color  ?? AppColors.primaryColor),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: vartical_pading ?? 16, horizontal: horizontal_pading ??16),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: border_color?? AppColors.primaryColor)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: border_color ?? AppColors.primaryColor)),
              ),
            ),
            isDropDown?? false
                ? Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Spacer(),
                  Text("${selectedDropDownValue}"),
                  // AppSpaces.spaces_width_5,
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      disabledHint: Container(),
                      isDense: false,
                      items: dropDownMenus!.map((String value) {
                        print("Value ===> ${value}");

                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: Get.textTheme.bodyText1,
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {
                        selectedDropDownMenuFn!(_!);
                      },
                      /*   selectedItemBuilder: (context) {
                          return [
                            Text(
                              selectedDropDownValue,
                              style: Get.textTheme.bodyText1,
                            )
                          ];
                        },*/
                    ),
                  ),
                  AppSpaces.spaces_width_5,
                ],
              ),
            )
                : Container(),
            obscureText!=null && obscureText == true
                ? Align(
              alignment: Alignment.centerRight,
              child: _Musk(
                isObscoard: (v){
                  setState((){_isObscord = v;});

                },
                textEditingController: controller!,
              ),
            )
                : Container()
          ],
        ),
      );
}



class _Musk extends StatefulWidget {
  TextEditingController textEditingController = new TextEditingController();
  Function(bool) isObscoard ;

  _Musk({Key? key, required this.textEditingController ,required this.isObscoard}) : super(key: key);

  @override
  State<_Musk> createState() => _MuskState();
}

class _MuskState extends State<_Musk> {
  bool _isMusk = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            _isMusk = !_isMusk;

            widget.isObscoard(_isMusk);
          });
        },
        icon:
            FaIcon(_isMusk ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye));
  }
}
