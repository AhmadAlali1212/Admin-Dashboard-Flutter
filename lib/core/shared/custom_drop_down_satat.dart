import 'package:adminapplication/data/model/categories_model.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listData;
  final TextEditingController dropDownSelectedName;
  final TextEditingController dropDownSelectedID;
  CustomDropDownSearch({
    super.key,
    required this.title,
    required this.listData,
    required this.dropDownSelectedName,
    required this.dropDownSelectedID,
  });

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  showDropDownState() async {
    await DropDownState(
      dropDown: DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        submitButtonStyle: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(70, 76, 222, 1),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        data: widget.listData,
        onSelected: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          final dynamic selectedData = selectedListItem.data;

          String name = "";
          String id = "";

          if (selectedData == null) {
            name = "";
            id = "";
          } else if (selectedData is String) {
            name = selectedData;
            id = selectedData;
          } else if (selectedData is Map) {
            name =
                (selectedData['name'] ??
                        selectedData['categories_name'] ??
                        selectedData['categoriesName'])
                    ?.toString() ??
                selectedData.toString();
            id =
                (selectedData['value'] ??
                        selectedData['id'] ??
                        selectedData['categories_id'] ??
                        selectedData['categoriesId'])
                    ?.toString() ??
                name;
          } else if (selectedData is CategoriesModel) {
            name = selectedData.categoriesName ?? "";
            id = selectedData.categoriesId?.toString() ?? "";
          } else {
            name = selectedData.toString();
            id = name;
          }
          print("name: $name, id: $id");

          widget.dropDownSelectedName.text = name;
          widget.dropDownSelectedID.text = id;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropDownSelectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDownState();
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        contentPadding: const EdgeInsets.only(
          left: 8,
          bottom: 0,
          top: 0,
          right: 15,
        ),
        hintText: widget.dropDownSelectedName.text == ""
            ? widget.title
            : widget.dropDownSelectedName.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
