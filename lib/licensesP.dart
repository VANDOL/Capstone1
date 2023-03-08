import 'package:flutter/material.dart';
import 'licenses.dart';
import 'oss_licenses_page.dart';

class LicensesP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('라이선스 정보')),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text(
                '플러터 오픈 라이선스 정보',
                style: TextStyle(fontSize: 23),
              ),
              tileColor: Color.fromARGB(255, 228, 228, 228),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OssLicensesPage()),
                );
              },
            ),
            ListTile(
              title: Text(
                '다른 라이선스 정보',
                style: TextStyle(fontSize: 23),
              ),
              tileColor: Color.fromARGB(255, 192, 192, 192),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => licenses()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
