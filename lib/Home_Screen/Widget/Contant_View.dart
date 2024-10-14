import 'package:flutter/material.dart';
typedef onBtnClick = void Function(int);
class ContantView extends StatefulWidget {
  double width;
  double height;
  String name;
  String phone;
  bool isVisable;
  onBtnClick btnClick;
  int index;
  ContantView(
      {required this.width,
      required this.height,
      required this.phone,
      required this.name,
      required this.isVisable,
      required this.btnClick,
      required this.index
      });

  @override
  State<ContantView> createState() => _ContantViewState();
}

class _ContantViewState extends State<ContantView> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisable,
      child: Container(
        padding: EdgeInsets.only(left: 0.05),
        alignment: Alignment.topLeft,
        width: 0.9 * widget.width,
        height: 0.13 * widget.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.1 * widget.width)),
        child: Row(
            children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Name: ${widget.name}",
                    style: TextStyle(fontSize: 0.05 * widget.width),
                  ),
                ),
                subtitle: Text(
                  "Phone: ${widget.phone}",
                  style: TextStyle(fontSize: 0.05 * widget.width, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: IconButton(
              iconSize: 0.07*widget.width,
              icon: Icon(Icons.delete),color: Colors.red,
              onPressed: (){
                setState(() {
                  widget.btnClick(widget.index);
                });
              },
            ),
          ),
        ]),
      ),
    );
    ;
  }
}
