import 'package:flutter/material.dart';
import 'package:fyp_frontend/models/MyDemand.dart';
import 'package:fyp_frontend/services/api_service.dart';
import '../../constants.dart';
import 'components/create_demand_screen.dart';
import 'components/demand_card.dart';

class DemandsScreen extends StatefulWidget {
  const DemandsScreen({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<DemandsScreen> createState() => _DemandsScreenState();
}

class _DemandsScreenState extends State<DemandsScreen> {
  List<MyDemand> demandList = [];

  getDemands() async {
    print(widget.userId);
    if (widget.userId != null) {
      await APIService.getDemands(widget.userId).then((response) {
        if (response != null) {
          setState(() {
            demandList = response;
          });
        }
      });
    }
  }

  @override
  void initState() {
    getDemands();
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Demands",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: (demandList == [])
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.7,
                ),
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                  child: DemandCard(
                    demand: demandList[index],
                  ),
                ),
                itemCount: demandList.length,
                scrollDirection: Axis.vertical,
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateDemandScreen(
                    userId: widget.userId,
                  ),
                )).then((value) => getDemands());
          },
          tooltip: 'Add Demand',
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
