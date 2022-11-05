import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/MyDemand.dart';
import '../../../constants.dart';

class DemandCard extends StatelessWidget {
  const DemandCard({Key? key, required this.demand}) : super(key: key);

  final MyDemand demand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        boxShadow: myBoxShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Demand No: ${demand.demandId}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      "Date: ${demand.createdDateTime.split("T")[0]}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Text(
                      "Status: ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      demand.demandStatus,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: (demand.demandStatus == "Urgent")
                              ? Colors.red
                              : Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                Row(
                  children: [
                    Text(
                      "Progress: ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      demand.demandProgress,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: (demand.demandProgress == "Pending")
                                ? Colors.orange
                                : (demand.demandProgress == "Accepted")
                                    ? Colors.green
                                    : Colors.red,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius)),
                      boxShadow: myBoxShadow,
                    ),
                    child: Text(
                      demand.message,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
