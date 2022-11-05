import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../services/api_service.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class CreateDemandScreen extends StatefulWidget {
  const CreateDemandScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<CreateDemandScreen> createState() => _CreateDemandScreenState();
}

class _CreateDemandScreenState extends State<CreateDemandScreen> {
  String? demandStatus;

  final myProductNameController = TextEditingController();
  final myMessageController = TextEditingController();

  bool isAPICalled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Add Demand",
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
                      "Product Name (Optional)",
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
                        controller: myProductNameController,
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
                      "Status",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: defaultPadding),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: lightGray1,
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadius)),
                        boxShadow: myBoxShadow,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: const Text(
                                "Urgent",
                                style: TextStyle(fontSize: 12),
                              ),
                              value: "Urgent",
                              groupValue: demandStatus,
                              onChanged: (value) {
                                setState(() {
                                  demandStatus = value.toString();
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              title: const Text(
                                "Not Urgent",
                                style: TextStyle(fontSize: 12),
                              ),
                              value: "Not Urgent",
                              groupValue: demandStatus,
                              onChanged: (value) {
                                setState(() {
                                  demandStatus = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
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
                                !isAPICalled &&
                                demandStatus != null) {
                              setState(() {
                                isAPICalled = true;
                              });

                              var model = {
                                "userId": widget.userId,
                                "status": demandStatus,
                                "message": myMessageController.text,
                              };

                              APIService.createDemand(model).then((response) =>
                                  {
                                    if (response)
                                      {
                                        setState(() {
                                          isAPICalled = false;
                                          myMessageController.clear();
                                          myProductNameController.clear();
                                          demandStatus = null;
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
                                if (demandStatus == null) {
                                  Get.snackbar(
                                    "Please select demand status",
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
                              primary: primaryColor,
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
