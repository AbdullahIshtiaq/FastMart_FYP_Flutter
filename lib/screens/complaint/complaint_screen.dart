import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../services/api_service.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class AddComplaintScreen extends StatefulWidget {
  const AddComplaintScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<AddComplaintScreen> createState() => _AddComplaintScreenState();
}

class _AddComplaintScreenState extends State<AddComplaintScreen> {
  final myTitleController = TextEditingController();
  final myMessageController = TextEditingController();

  bool isAPICalled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Add Complaint",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: (MediaQuery.of(context).size.height) - 100,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius)),
            boxShadow: myBoxShadow,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: defaultPadding),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius)),
                        boxShadow: myBoxShadow,
                      ),
                      child: TextFormField(
                        controller: myTitleController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: lightGray1,
                          border: outlineInputBorder,
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: outlineInputBorder,
                          focusedBorder: outlineInputBorder,
                          errorBorder: outlineInputBorder,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    Text(
                      "Message",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: defaultPadding),
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: lightGray1,
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius)),
                        boxShadow: myBoxShadow,
                      ),
                      child: TextFormField(
                        maxLines: 5,
                        controller: myMessageController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: lightGray1,
                          border: outlineInputBorder,
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: outlineInputBorder,
                          focusedBorder: outlineInputBorder,
                          errorBorder: outlineInputBorder,
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding * 6),
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            print(myMessageController.text);
                            print(isAPICalled);
                            if ((myMessageController.text.isNotEmpty &&
                                    myMessageController.text != "") &&
                                !isAPICalled) {
                              setState(() {
                                isAPICalled = true;
                              });

                              var model = {
                                "userId": widget.userId,
                                "title": myTitleController.text,
                                "message": myMessageController.text,
                              };

                              APIService.createDemand(model).then((response) =>
                                  {
                                    if (response)
                                      {
                                        setState(() {
                                          isAPICalled = false;
                                          myMessageController.clear();
                                          myTitleController.clear();
                                        }),
                                        Get.snackbar(
                                            "Demand Added Successfully", "",
                                            snackPosition: SnackPosition.BOTTOM,
                                            duration:
                                                const Duration(seconds: 1)),
                                      }
                                    else
                                      {
                                        setState(() {
                                          isAPICalled = false;
                                        }),
                                        Get.snackbar(
                                          "Demand not added",
                                          "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          duration: const Duration(seconds: 1),
                                        )
                                      }
                                  });
                            } else {
                              setState(() {
                                isAPICalled = false;
                                if (myTitleController.text.isEmpty ||
                                    myTitleController.text == "") {
                                  Get.snackbar(
                                    "Please enter title",
                                    "",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 1),
                                  );
                                } else {
                                  Get.snackbar(
                                    "Please enter message",
                                    "",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 1),
                                  );
                                }
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: const StadiumBorder()),
                          child: const Text("Submit"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
