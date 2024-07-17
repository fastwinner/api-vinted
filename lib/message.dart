import 'package:flutter/material.dart';

class messagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MessagesScreen(),
    );
  }
}

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Messages",
          style: TextStyle()),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.teal,
            tabs: [
              Tab(text: 'Messages'),
              Tab(text: 'Notifications'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                buildEmptyMessagesTab(),
                buildNotificationsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyMessagesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline, size: 50, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Aucun message',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Lorsque quelqu\'un t\'envoie un message, il apparaît ici',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Reçois tes notifications instantanément sur ton mobile',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
