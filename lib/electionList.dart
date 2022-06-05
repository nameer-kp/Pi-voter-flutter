import 'package:flutter/material.dart';

class ElectionList extends StatelessWidget {
  const ElectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 80, top: 60),
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTjXxii2m2iv55wN4GT_Y9fEQeG9OhPd4KBur4_n9z4vjqlp8RvDlEHCKDkOtGw_TZ3M&usqp=CAU"),
              title: Text(
                "Akhil Mohan",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text("LLP", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCmZlGD0QeDpTOq4Og5oz0EqFpIB5GevAcgCzdh5ksf8UyoETm3GJbNl5SiTpQw_3WeUE&usqp=CAU"),
              title: Text(
                "Mohan Kumar",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text("MMP", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8u5DQuzwho_79qTuJOfHKu-H2bQmbPWFgiliaMy_fP_ZxRjEB_dcDTUov8j505G2M0w&usqp=CAU"),
              title: Text(
                "Lena",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text("PPK", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
