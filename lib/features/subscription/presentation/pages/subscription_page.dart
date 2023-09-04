import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Professional Plan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$42/mo",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _containerButton(title: "Upgrade Plan", buttonColor: Colors.cyan),
            SizedBox(
              height: 20,
            ),
            _planItem(
                title: "Available even when demand is high",
                iconColor: Colors.green),
            SizedBox(
              height: 20,
            ),
            _planItem(title: "Faster response speed", iconColor: Colors.green),
            SizedBox(
              height: 20,
            ),
            _planItem(
                title: "Priority access to new features",
                iconColor: Colors.green),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Free Plan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            _containerButton(title: "Upgrade Plan", buttonColor: Colors.grey),
            SizedBox(height: 20,),
            _planItem(
                title: "Available when demand is low",
                iconColor: Colors.grey),
            SizedBox(height: 20,),
            _planItem(
                title: "Standard response speed",
                iconColor: Colors.grey),
            SizedBox(height: 20,),
            _planItem(
                title: "Regular model updates",
                iconColor: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _containerButton({required String title,required Color buttonColor}) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        "$title",
        style: TextStyle(fontSize: 18),
      )),
    );
  }

  Widget _planItem({required String title, required Color iconColor}) {
    return Row(
      children: [
        Icon(
          Icons.done_outline,
          color: iconColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text("$title"),
      ],
    );
  }
}
