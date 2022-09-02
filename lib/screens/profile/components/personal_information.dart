import 'package:flutter/material.dart';

import '../../../constants.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    Key? key,
    required this.username,
    required this.email,
    required this.joiningDate
  }) : super(key: key);

  final String username;
  final String email;
  final String joiningDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultBorderRadius)),
        boxShadow: myBoxShadow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name:",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                username,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Email:",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                email,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Phone:",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "+923401559089",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Joining Date:",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                filterDate(joiningDate),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Zip:",
          //       style: Theme.of(context).textTheme.bodyText2,
          //     ),
          //     Text(
          //       "34000",
          //       style: Theme.of(context)
          //           .textTheme
          //           .titleMedium!
          //           .copyWith(fontWeight: FontWeight.w500),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
  
  String filterDate(String date){
    var str = date.split('T');
    return str[0];
  }
}
