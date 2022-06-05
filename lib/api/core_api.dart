import 'dart:convert';

import 'package:app_vote/models/election.dart';
import 'package:app_vote/models/winner.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../models/candidate.dart';

class CoreAPI {
  static Future<List<Election>> getElections() async {
    final url = 'http://43.204.209.119:4000/electiontableview';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    final elections = json.decode(response.body);
    print(elections);
    print(elections.runtimeType);
    final elecs = (elections as List).map((e) => Election.fromJson(e)).toList();
    print(elecs);
    return elecs;
  }

  static Future<Winner> getResult(Election election) async {
    final url = Uri.parse('http://43.204.209.119:4000/winner');

    final response = await http.post(url,
        body: {'election': election.name},
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
    print(response.body);
    final resp = json.decode(response.body);
    final winner = Winner.fromJson(resp[0]);
    return winner;
  }

  static Future<List<Candidate>> getCandidates() async {
    print("Runnning upoload");
    final url = 'http://43.204.209.119:4000/candidatetableview';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    final candi = json.decode(response.body);
    print(candi);

    final candidates =
        (candi as List).map((e) => Candidate.fromJson(e)).toList();
    return candidates;
  }

  static Future sendImage(XFile imageFile, Candidate candidate) async {
    var dio = Dio();
    final imageBytes = await imageFile.readAsBytes();
    final url = 'http://43.204.209.119:5000/facesvc';
    final formData = FormData.fromMap({
      "candidate": "6699",
      "voterId": "7799",
      // "imagefile": MultipartFile.fromBytes(imageBytes),
    });
    final response = await dio.post(url, data: formData);
    print(response.data);
    // final imageBytes = await imageFile.readAsBytes();
    // final request = http.MultipartRequest("POST", Uri.parse(url));
    // request.fields['candidate'] = '6699';
    // request.fields['voterId'] = '7799';
    // request.files.add(http.MultipartFile.fromBytes(
    //   'imagefile',
    //   imageBytes,
    // ));

    // request.send().then((response) {
    //   print("sent");
    //   if (response.statusCode == 200) print("Uploaded!");
    // });
    // final map = {};
    // map['imagefile'] = imageBytes.toString();
    // map['candidateid'] = "6699";
    // map['voterId'] = "7799";
    // final response = await http.post(Uri.parse(url), body: map);
    // print(response.body);

//     imagefile
// voterid
// candidateid
// {error:false}
  }
}
