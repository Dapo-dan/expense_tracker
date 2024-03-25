import 'package:expense_tracker/constants/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  List<String> myCategoryIcons = [
    'assets/entertainment.png',
    'assets/family.png',
    'assets/food.png',
    'assets/home.png',
    'assets/shopping.png',
    'assets/tech.png',
    'assets/travel.png',
  ];

  @override
  void initState() {
    dateController.text = DateFormat("dd/MM/yyyy").format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Expenses",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(
                16,
              ),
              SizedBox(
                width: screenWidth(context) * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 16,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              verticalSpace(
                32,
              ),
              TextFormField(
                controller: categoryController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.list,
                      size: 16,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              bool isExpanded = false;
                              String iconSelected = "";
                              Color categoryColor = Colors.white;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text(
                                    "Create Category",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  content: SizedBox(
                                    width: screenWidth(context),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: "Name",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        verticalSpace(
                                          16,
                                        ),
                                        TextFormField(
                                          onTap: () {
                                            setState(() {
                                              isExpanded = !isExpanded;
                                            });
                                          },
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            suffixIcon: Icon(
                                              isExpanded
                                                  ? CupertinoIcons.chevron_up
                                                  : CupertinoIcons.chevron_down,
                                            ),
                                            fillColor: Colors.white,
                                            hintText: "Icon",
                                            border: OutlineInputBorder(
                                              borderRadius: isExpanded
                                                  ? const BorderRadius.vertical(
                                                      top: Radius.circular(12),
                                                    )
                                                  : BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        if (isExpanded)
                                          Container(
                                            padding: const EdgeInsets.all(20),
                                            width: screenWidth(context),
                                            height: 200,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                bottom: Radius.circular(12),
                                              ),
                                            ),
                                            child: GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10,
                                                ),
                                                shrinkWrap: true,
                                                itemCount:
                                                    myCategoryIcons.length,
                                                itemBuilder: (context, int i) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        iconSelected =
                                                            myCategoryIcons[i];
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 3,
                                                          color: iconSelected ==
                                                                  myCategoryIcons[
                                                                      i]
                                                              ? Colors.black
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            myCategoryIcons[i],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        verticalSpace(
                                          16,
                                        ),
                                        TextFormField(
                                          readOnly: true,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            filled: true,
                                            fillColor: categoryColor,
                                            hintText: "Color",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (ctx2) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        ColorPicker(
                                                            pickerColor:
                                                                categoryColor,
                                                            onColorChanged:
                                                                (value) {
                                                              setState(() {
                                                                categoryColor =
                                                                    value;
                                                              });
                                                            }),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          height: 50,
                                                          child: TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  ctx2);
                                                            },
                                                            style: TextButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  12,
                                                                ),
                                                              ),
                                                            ),
                                                            child: const Text(
                                                              'Save',
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                        ),
                                        verticalSpaceMedium,
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12,
                                                ),
                                              ),
                                            ),
                                            child: const Text(
                                              'Save',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                      icon: const Icon(
                        FontAwesomeIcons.plus,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    )),
              ),
              verticalSpace(
                16,
              ),
              TextFormField(
                controller: dateController,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    FontAwesomeIcons.clock,
                    size: 16,
                    color: Colors.grey,
                  ),
                  hintText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  );

                  if (newDate != null) {
                    setState(() {
                      dateController.text =
                          DateFormat("dd/MM/yyyy").format(newDate);
                      selectDate = newDate;
                    });
                  }
                },
              ),
              verticalSpace(
                64,
              ),
              SizedBox(
                width: screenWidth(context),
                height: kTextTabBarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
