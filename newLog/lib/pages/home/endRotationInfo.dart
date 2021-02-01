import 'package:flutter/material.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:provider/provider.dart';

class EndRotationInfo extends StatefulWidget {
  final int rotationNo;
  EndRotationInfo({this.rotationNo});
  @override
  _EndRotationInfoState createState() => _EndRotationInfoState();
}

class _EndRotationInfoState extends State<EndRotationInfo> {
  Widget _createTextArea(String label, String text) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text(
        '$label $text',
        //textAlign: TextAlign.right,
        style: TextStyle(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final Publications = Provider.of<List<Publications_model>>(context) ?? [];
    final caseroutine = Provider.of<User>(context);

    // return ListView.builder(
    //   itemCount: Publications.length,
    //   itemBuilder: (context, index) {
    //     return Publications_Tile(Publications_item: Publications[index]);
    //   },
    // );
    return StreamBuilder<List<EndRotation>>(
        stream: DatabaseService(uid: caseroutine.uid).listOfEndRotation,
        builder: (context, snapshot) {
          //print(snapshot.hasData);
          if (snapshot.hasData) {
            List<EndRotation> listOfEndRotationData = snapshot.data;
            return SafeArea(
              child: (listOfEndRotationData[widget.rotationNo].antCareL != '') ? Padding(
                padding: const EdgeInsets.all(0.0),
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Category: Patient Care'),
                      DataTable(
                        dataRowHeight:200.0,
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Competency     ',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Level',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Remarks',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Antepartum Care and Complications of Pregnancy')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Care of Patients in the Intrapartum Period')),
                              DataCell(Text('')),
                              DataCell(Text('Professor')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Care of Patients in the Postpartum Period')),
                              DataCell(Text('27')),
                              DataCell(Text('Associate Professor')),
                            ],
                          ),
                           DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Obstetrical Technical Skills')),
                              DataCell(Text('19')),
                              DataCell(Text('Student')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Gynecology Technical Skills: Laparotomyand vaginal surgery (e.g., abdominal Hysterectomy, Myomectomy, Adnexectomy, Vaginal Hysterectomy, Colporrhaphy, Mid-urethral Sling)')),
                              DataCell(Text('43')),
                              DataCell(Text('Professor')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Gynecology Technical Skills: Endoscopy (Laparoscopy, Hysteroscopy, Cystoscopy)')),
                              DataCell(Text('27')),
                              DataCell(Text('Associate Professor')),
                            ],
                          ),
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text('Family Planning')),
                                DataCell(Text('27')),
                                DataCell(Text('Accountability and Responsiveness to the Needs of Patients, Society, and the Profession Professor')),
                              ],
                            ),

                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Text('Category: Professionalism'),
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Competency',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Level',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Remarks',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Accountability and Responsiveness to the Needs of Patients, Society, and the Profession')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Respect for Patient Privacy, Autonomy, Patient-Physician Relationship')),
                              DataCell(Text('')),
                              DataCell(Text('Professor')),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 40.0,),
                      Text('Category: Interpersonal and Communication Skills'),
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Competency',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Level',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Remarks',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Communication with Patients and Families')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Communication with Physicians and Other Health Professionals and Teamwork')),
                              DataCell(Text('')),
                              DataCell(Text('Professor')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Informed Consent and Shared Decision Making')),
                              DataCell(Text('')),
                              DataCell(Text('Professor')),
                            ],
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              )
                  :
              Align(
                alignment: Alignment.center,
                child: Text(
                  'No information available! Edit to Update',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}