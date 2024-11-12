import 'package:flutter/material.dart';

class BillingPage extends StatefulWidget {
  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildSubscriptionPlan(String title, String price, String duration) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          price,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Text(
          '/$duration',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
        Divider(color: Colors.blueAccent),
        SizedBox(height: 8),
        ...[
          'Ad-free experience.',
          'Unlock and unlimited access to all premium contents.',
          'Advanced mood tracking with detailed insights and trend analysis.',
          'Early access to new features and beta tests.',
          'Priority customer support.',
        ].map((benefit) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.black, size: 18),
              SizedBox(width: 8),
              Expanded(child: Text(benefit)),
            ],
          ),
        )),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Handle payment logic here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          ),
          child: Text('Pay Now', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Upgrade Plan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,  // Set title to bold
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.cyan,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Monthly'),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Yearly'),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: buildSubscriptionPlan(
                    'MENTAL HEALTH CARE',
                    '\$5',
                    'Month',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: buildSubscriptionPlan(
                    'MENTAL HEALTH CARE',
                    '\$35',
                    'Year',
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
