import 'package:flutter/material.dart';
import 'package:jmnchelogbook/services/database.dart';
import 'package:jmnchelogbook/models/user.dart';
import 'package:provider/provider.dart';

class MissionTab extends StatefulWidget {
  @override
  _MissionTabState createState() => _MissionTabState();
}

class _MissionTabState extends State<MissionTab> {
  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<MissionData>(
      stream: DatabaseService(uid: user.uid).missionData,
      builder: (context, snapshot1) {
        return StreamBuilder<ResidentData>(
            stream: DatabaseService(uid: user.uid).residentData,
            builder: (context, snapshot2) {
              if (snapshot1.hasData && snapshot2.hasData) {
                MissionData missionData = snapshot1.data;
                ResidentData residentData = snapshot2.data;
                return Scaffold(

                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Text(
                              'Residency Program Vision, Mission and Objectives',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'In order to  train outstanding obstetricians-gynecologists'
                                ' capable of becoming leaders in our field the Department of OBG'
                                ', JNMC, AMU, Aligarh has the following Vision, Mission and Objectives:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
                          child: Text(
                            'Vision',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'The Department of Obstetrics & Gynaecology, strives to be a'
                                ' regional leader in training healthcare professionals who are competent'
                                ' to provide Reproductive Health Care of international standards but in'
                                ' a regional context and in alignment with our National Goals. ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
                          child: Text(
                            'Mission',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'We strive to nurture an academic environment conducive to '
                                'acquiring and imparting high-quality education, conducting innovative'
                                ' scientific research and competency based training for providing '
                                'promotive, preventive and curative medical care in an empathetic, '
                                'humanistic and ethical manner. ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
                          child: Text(
                            'Objectives',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '1.	To equip students with the knowledge, skills and attitude '
                                'required to manage problems related to obstetric and gynecology \n2.'
                                '	To be a centre of excellence for providing training in emergency '
                                'obstetric care and thereby reduce maternal and neonatal morbidity and'
                                ' mortality in alignment with our National goals..\n3.	To provide'
                                ' round the clock Family Planning services and training for the same.'
                                '\n4.	To conduct outreach programmes and provide training in preventive'
                                ' and promotive reproductive health-care activities with focus on '
                                'antenatal care and preventive oncology.\n5.	To provide training in'
                                ' state of the art technological advances keeping in mind the job market'
                                ' dynamics.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
                          child: Text(
                            'Mother and Baby-Friendly Hospital Policies',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'At the Department of OBG, JNMC, AMU, Aligarh we are dedicated '
                                'towards providing respectful maternity care by following Mother and'
                                ' Baby-Friendly Hospital Policies. We therefore direct you to read this'
                                ' document carefully and sign the pledge.  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 100, 10),
                          child: Text(
                            'Pledge',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20.0,
                              //fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'I pledge that I will provide care to my patients in a manner'
                                ' which is compatible with Mother and Baby-Friendly Hospital Policies '
                                'as follows:\n \n1.	Offer all birthing mothers:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 8, 8, 8),
                          child: Text(
                            '•	Unrestricted access to a female birth companion of her choice'
                                '.\n•	Unrestricted access to continuous emotional and physical support.'
                                '\n•	Access to professional midwifery care.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '2.	Provide accurate descriptive and statistical information to'
                                ' the patients about our practices and procedures for birth care, '
                                'including measures of interventions and outcomes.\n3.	Provide culturally'
                                ' competent care —that is, care that is sensitive and responsive to the '
                                'specific beliefs, values, and customs of the mother’s ethnicity and '
                                'religion.\n4.	Provide the birthing woman with the freedom to walk, move '
                                'about, and assume the positions of her choice during labor and birth '
                                '(unless restriction is specifically required to correct a complication)'
                                '\n5.	Have clearly defined policies and procedures for:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 8, 8, 8),
                          child: Text(
                            '•	Collaborating and consulting throughout the perinatal period'
                                ' with other maternity services, including communicating with the original'
                                ' caregiver when transfer from one birth site to another is necessary'
                                '\n•	Linking the mother and baby to appropriate community resources, '
                                'including prenatal and post-discharge follow-up and breastfeeding '
                                'support.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '6.	Do not routinely employ practices and procedures that are '
                                'unsupported by scientific evidence.\n7.	Educate staff in non-drug methods'
                                ' of pain relief, and discourage the use of analgesic or anesthetic drugs'
                                ' not specifically required to correct a complication.\n8.	Encourage all'
                                ' mothers and families, including those with sick or premature newborns'
                                ' or infants with congenital problems, to touch, hold, breastfeed, and'
                                ' take care of their babies to the extent compatible with their '
                                'conditions.\n9.	Discourage non-religious circumcision of the newborn.'
                                '\n10.	Strives to achieve the WHO-UNICEF “Ten Steps of the Baby-Friendly'
                                ' Hospital Initiative” to promote successful breastfeeding as follows:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 8, 8, 8),
                          child: Text(
                            '1)	Have a written breastfeeding policy that is routinely'
                                ' communicated to all health care staff\n2)	Train all health care staff'
                                ' in skills necessary to implement this policy\n3)	Inform all pregnant women'
                                ' about the benefits and management of breastfeeding\n4)	Help mothers'
                                ' initiate breastfeeding within a half-hour of birth\n5)	Show mothers how'
                                ' to breastfeed and how to maintain lactation even if they should be'
                                ' separated from their infants\n6)	Give newborn infants no food or drink'
                                ' other than breast milk unless medically indicated\n7)	Practice rooming'
                                ' in: allow mothers and infants to remain together 24 hours a day\n8)'
                                '	Encourage breastfeeding on demand\n9)	Give no artificial teat or '
                                'pacifiers (also called dummies or soothers) to breastfeeding infants'
                                '\n10)	Foster the establishment of breastfeeding support groups and refer'
                                ' mothers to them on discharge from hospitals or clinics',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              //fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        !missionData.agree
                            ? CheckboxListTile(
                          title: Text(
                            'I agree to all the missions, objectives and pledges'
                                ' stated on this page',
                            style: TextStyle(fontSize: 10),
                          ),
                          checkColor: Colors.black,
                          activeColor: Colors.teal,
                          value: value1,
                          onChanged: (bool value) {
                            setState(() {
                              value1 = !value1;
                            });
                          },
                          controlAffinity:
                          ListTileControlAffinity.leading,
                        )
                            : Container(),
                        !missionData.agree
                            ? Visibility(
                          maintainState: true,
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            child: RaisedButton(
                              color: value1
                                  ? Colors.teal
                                  : Colors.white38,
                              child: Text(
                                'Agree',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                setState(() {
                                  if (value1) {
                                    DatabaseService(uid: user.uid)
                                        .updateUserDataForMission(
                                        !missionData.agree,
                                        residentData.name);
                                  }
                                });
                              },
                            ),
                          ),
                        )
                            : Padding(
                          padding:
                          const EdgeInsets.fromLTRB(250, 10, 10, 0),
                          child: Text(
                            residentData.name,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: Text('Loading...',
                    style: TextStyle(
                      fontSize: 30.0
                    ),),
                  )
                );
              }
            });
      },
    );
  }
}
