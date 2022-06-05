import 'package:app_vote/api/core_api.dart';
import 'package:app_vote/candidates_page.dart';
import 'package:app_vote/models/election.dart';
import 'package:flutter/material.dart';

class ElectionList extends StatelessWidget {
  const ElectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Elections",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<Election>>(
        future: CoreAPI.getElections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data == null)
            return Text('Somethinfg went wrong please try again later');
          final elections = snapshot.data!;
          return ListView.separated(
            separatorBuilder: ((context, index) => Divider()),
            itemBuilder: ((context, index) {
              final election = elections[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CandidatesPage(
                          election: election,
                        ),
                      ),
                    );
                  },
                  title: Text(election.name),
                  subtitle: Text('No of candidates: ' +
                      election.noOfCandidates.toString()),
                  // leading: Image.network(
                  //     'https://source.unsplash.com/random?sig=index'),
                ),
              );
            }),
            itemCount: elections.length,
          );
        },
      ),
      // body: Container(
      //   padding: EdgeInsets.only(left: 80, top: 60),
      //   child: Container(
      //     child: Column(
      //       children: [
      //         ElevatedButton(
      //             onPressed: () {
      //               CoreAPI.getElections();
      //             },
      //             child: Text('test')),
      //         ListTile(
      //           leading: Image.network(
      //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTjXxii2m2iv55wN4GT_Y9fEQeG9OhPd4KBur4_n9z4vjqlp8RvDlEHCKDkOtGw_TZ3M&usqp=CAU"),
      //           title: Text(
      //             "Akhil Mohan",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           subtitle: Text("LLP", style: TextStyle(color: Colors.white)),
      //         ),
      //         SizedBox(height: 30),
      //         ListTile(
      //           leading: Image.network(
      //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCmZlGD0QeDpTOq4Og5oz0EqFpIB5GevAcgCzdh5ksf8UyoETm3GJbNl5SiTpQw_3WeUE&usqp=CAU"),
      //           title: Text(
      //             "Mohan Kumar",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           subtitle: Text("MMP", style: TextStyle(color: Colors.white)),
      //         ),
      //         SizedBox(height: 30),
      //         ListTile(
      //           leading: Image.network(
      //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8u5DQuzwho_79qTuJOfHKu-H2bQmbPWFgiliaMy_fP_ZxRjEB_dcDTUov8j505G2M0w&usqp=CAU"),
      //           title: Text(
      //             "Lena",
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           subtitle: Text("PPK", style: TextStyle(color: Colors.white)),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
