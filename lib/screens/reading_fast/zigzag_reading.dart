import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:improve_memory/resources/asset_resource.dart';
import 'package:improve_memory/resources/color_resource.dart';
import 'package:improve_memory/resources/edge_insets_manager.dart';
import 'package:improve_memory/resources/extensions.dart';
import 'package:improve_memory/resources/text_styles.dart';

class ZigZagReading extends StatefulWidget {
  const ZigZagReading({super.key});

  @override
  State<ZigZagReading> createState() => _ZigZagReadingState();
}

class _ZigZagReadingState extends State<ZigZagReading> {
  PDFViewController? controller;
  final textController = TextEditingController();
  var pages = 0;
  var currentPage = 0;
  bool isReady = false;
  ByteData? loadedRootBundleFile;
  AssetImage? info;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      loadedRootBundleFile = await rootBundle.load(PdfFile.readingFast);
      if (mounted) {
        setState(() {});
        info = await showModalBottomSheet<AssetImage>(
            context: context,
            builder: (ctx) {
              return SelectZigZagShape();
            });
        if (info == null) {
          if (mounted) {
            Navigator.of(context).pop();
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: loadedRootBundleFile != null
            ? Stack(
                children: [
                  PDFView(
                    pdfData: loadedRootBundleFile?.buffer.asUint8List(),
                    onViewCreated: (c) async {
                      setState(() {
                        controller = c;
                      });
                    },
                    onRender: (val) {
                      pages = val ?? 0;
                    },
                    onPageChanged: (page, total) {
                      setState(() {
                        textController.value =
                            TextEditingValue(text: page.toString());
                      });
                    },
                    pageSnap: true,
                  ),
                  if (info != null)
                    IgnorePointer(
                      child: Align(
                        heightFactor: 3,
                        child: Opacity(
                          opacity: 0.2,
                          child: Card(
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(image: info!)),
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  PageNumberScroller(
                    textController: textController,
                    controller: controller,
                    pages: pages,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black26,
                        child: Text(
                          pages == 0
                              ? ''
                              : "${textController.value.text}/${(pages - 1).toString()}",
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}

class PageNumberScroller extends StatelessWidget {
  const PageNumberScroller({
    super.key,
    required this.textController,
    required this.controller,
    required this.pages,
  });

  final TextEditingController textController;
  final PDFViewController? controller;
  final int pages;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 3,
      child: Card(
        elevation: 15,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.14,
          width: MediaQuery.of(context).size.width * 0.1,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  final previousPage = int.parse(textController.value.text) - 1;
                  if (previousPage != -1) {
                    controller?.setPage(previousPage);
                  }
                },
                icon: Icon(Icons.arrow_upward),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration.collapsed(
                  hintText: '',
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  final page = int.tryParse(value) ?? 0;
                  if (page >= 0 && page <= pages) {
                    controller?.setPage(page);
                  }
                },
              ),
              IconButton(
                onPressed: () {
                  final nextPage = int.parse(textController.value.text) + 1;
                  if (nextPage <= pages) {
                    controller?.setPage(nextPage);
                  }
                },
                icon: Icon(Icons.arrow_downward),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ZigZagProof {
  ZigZagProof(this.shapeNumber);
  final int shapeNumber;
  List<Map<String, AssetImage>> get images {
    return [
      for (var i in ['a', 'b', 'c'])
        {"$i$shapeNumber": AssetImage("assets/zigzag_proof/$i$shapeNumber.png")}
    ];
  }
}

class SelectZigZagShape extends StatefulWidget {
  const SelectZigZagShape({super.key});

  @override
  State<SelectZigZagShape> createState() => _SelectZigZagShapeState();
}

class _SelectZigZagShapeState extends State<SelectZigZagShape> {
  final List<int> chipItems = [10, 11];

  int? selectedChip;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.34,
      child: Column(
        children: [
          Padding(
            padding: e_8_all,
            child: Row(
              children: [
                Text('select category'),
                Spacer(),
                Row(
                  spacing: 5,
                  children: chipItems.map((chipValue) {
                    return FilterChip(
                      label: Text(chipValue.toString()),
                      onSelected: (val) {
                        setState(() {
                          selectedChip = chipValue;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      selected: selectedChip == chipValue,
                      color: WidgetStateProperty.all(selectedChip == chipValue
                          ? ColorResource.blue
                          : ColorResource.white),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          if (selectedChip != null)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 15,
                children: ZigZagProof(selectedChip!).images.map((value) {
                  final entry = value.entries.first;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(entry.value);
                    },
                    child: Container(
                      height: context.height * 0.23,
                      width: context.width * 0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: entry.value,
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: ColorResource.white,
                        child: Text(
                          entry.key,
                          style: h2OrangeTextStyle,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
