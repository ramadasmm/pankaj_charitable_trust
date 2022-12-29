import 'package:flutter/material.dart';
import 'package:pankaj_charitable_trust/api/base_client.dart';

import 'package:pankaj_charitable_trust/models/recipients/recipients_model.dart';

import '../../Widgets/AppBar/app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BaseClient().getRecipient();
    Recipient recipient;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget2(title: 'Profile')),
      body: FutureBuilder(
        future: BaseClient().getRecipient(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            recipient = recipientFromJson(snapshot.data);
            if (recipient.status == 0) {
              return Center(
                child: Text(recipient.message.toString()),
              );
            } else if (recipient.status == 1 && recipient.count == 0) {
              return Center(
                child: Text('No data'),
              );
            } else if (recipient.status == 1 && recipient.count != 0) {
              return ListView.builder(
                  itemCount: recipient.count,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(recipient.data![index].name.toString()),
                      subtitle: Text(recipient.data![index].college.toString()),
                    );
                  });
            } else if (recipient.status == 1 && recipient.count == 0) {
              return Center(
                child: Text(recipient.data.toString()),
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
