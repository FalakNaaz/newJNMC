import 'package:flutter/material.dart';

class Blueprint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const rowSpacer = TableRow(children: [
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 12,
      ),

    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Appendix 1: Blueprint for Evaluation'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Following are the different levels of competency for your assessment. Our aim is that you should reach the highest level during your training.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '1. Antepartum Care and Complications of Pregnancy — Patient Care',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                /*columnWidths: {
                  0: FlexColumnWidth(
                      4),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(4),
                },*/
                // textDirection: TextDirection.rtl,
                //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                // border:TableBorder.all(width: 2.0,color: Colors.red),
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates basic knowledge of normal obstetrical care and common medical complications seen in pregnancy',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Provides complete antepartum care for women with uncomplicated pregnancies\n\nRecognizes basic risk factors, symptoms, and signs of common medical complications (e.g., hypertension, diabetes, infectious diseases)\n\nRecognizes basic risk factors, symptoms, and signs of common obstetrical conditions (e.g., post-term gestation, abnormal placentation, third trimester bleeding)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Manages common medical complications (e.g., hypertension, diabetes, infectious diseases)\n\nManages common obstetrical complications (e.g., previous Cesarean section, abnormal fetal growth, multifetal gestation)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Demonstrates a comprehensive understanding of the varying patterns of presentation and treatment options for a variety of medical and obstetrical complications\n\nRecognizes atypical presentations of medical and obstetrical complications;identifies indications for consultation, referral, and/or transfer of care for patients with medical and obstetrical complications\n\nEffectively supervises and educates lower level residents in antepartum care\n\nCollaborates and provides consultation to other members of the health care team in antepartum care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Manages patients with complex and atypical medical and obstetrical complicationsApplies innovative approaches to complex and atypical antepartum conditions and implements treatment plans based on emerging evidence',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '2. Care of Patients in the Intrapartum Period — Patient Care ',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates basic knowledge of routine/uncomplicated intrapartum obstetrical care including, conduct of normal labor',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Provides intrapartum obstetrical care for women with uncomplicated pregnancies (e.g., identification of fetal lie, interpretation of fetal heart rate monitoring, and tocodynamometry)\n\nDifferentiates between normal and abnormal labor\n\n Recognizes intrapartum complications (e.g., chorioamnionitis, shoulder dystocia)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Manages abnormal labor \n\nManages intrapartum complications (e.g., cord prolapse, placental abruption)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Provides care for women with complex intrapartum complications and conditions\n\nIdentifies indications for consultation, referral, and/or transfer of care for patients with intrapartum complications \n\nEffectively supervises and educates lower-level residents in intrapartum care \n\nCollaborates and provides consultation to other members of the health care team in intrapartum care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applies innovative approaches to complex and atypical intrapartum conditions and implements treatment plans based on emerging evidence',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '3. Care of Patients in the Postpartum Period — Patient Care',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates basic knowledge of normal postpartum care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Provides postpartum care for women with uncomplicated pregnancies, including lactation counseling\n\nRecognizes basic risk factors, symptoms, and signs, of common postpartum complications (e.g., postpartum hemorrhage, infection, venous thromboembolism, depression)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Manages common postpartum complications\n\nCorrectly interprets the results of obstetric pathology and laboratory reports to ascertain the etiology of obstetrical outcomes',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Manages patients with complex complications of the postpartum period (e.g., septic pelvic thrombophlebitis, pulmonary embolism)\n\nDetermines the need for consultation, referral, or transfer for patients with complex complications in the postpartum period\n\n Counsels patients about the risk of recurrence of antepartum, intrapartum, and postpartum complications (e.g., preeclampsia, pre-term delivery, shoulder dystocia, depression)\n\nEffectively supervises and educates lower-level residents in postpartum care\n\nCollaborates and provides consultation to other members of the health care team in postpartum care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applies innovative approaches to complex and atypical postpartum conditions and implements treatment plans based on emerging evidence',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '4. Obstetrical Technical Skills — Patient Care',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates basic surgical principles, including use of universal precautions and aseptic technique\n\nPerforms basic procedures, including speculum examination and cervical examination',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Performs basic obstetrical skills, including:\n\na) assessment of cervical dilation\n\n b) spontaneous vaginal delivery\n\nc)ultrasound for assessment of fetal number, lie, presentation, viability, and placental location',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Performs obstetrical procedures, including: /n/n a) ultrasound to obtain fetal biometry\n\nb) biophysical profile\n\nc) repair of second degree perineal or vaginal lacerations\n\nd) primary Cesarean section\n\ne) uterine evacuation in the second trimester (e.g., induction, postpartum curettage)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Educates and supervises lower-level residents in performing obstetrical procedures\n\nCollaborates and provides consultation to other members of the health care team in performing obstetrical procedures\n\nnerforms complex obstetrical procedures, including:\n\na) operative vaginal delivery\n\nb)  repair of 3rd- and 4th-degree perineal lacerations\n\nc) repeat Cesarean section\n\nd) cervical cerclage\n\ne) breech vaginal delivery (including second twins)\n\nf) cystotomy repair/n/ne) surgical management of postpartum hemorrhage (e.g., Cesarean hysterectomy, peripartum hysterectomy)\n\n Manages and repairs uterine rupture or perforation',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applies innovative approaches to complex and atypical intrapartum conditions and implements treatment plans based on emerging evidence',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '5.  Gynecology Technical Skills: Laparotomyand vaginal surgery (e.g., abdominal  Hysterectomy, Myomectomy,  Adnexectomy, Vaginal Hysterectomy, Colporrhaphy,   Mid-urethral Sling) — Patient Care',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates knowledge of basic abdominal and pelvic anatomy\n\nDemonstrates basic surgical principles, including use of universal precautions and aseptic technique\n\nPositions patient appropriately for surgery',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Works effectively as a surgical assistant\n\nPerforms simple abdominal incision and closure\n\nPerforms simple vaginal or vulvar incision and repair\n\nDemonstrates basic surgical skills, including: -knot tying, \n\nsimple suturing, \n\nsuture and staple removal',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Demonstrates appropriate tissue handling, request for instruments, and flow of the procedure\n\nUnderstands and uses various forms of energy sources used in surgery\n\nPerforms uncomplicated gynecologic procedures\n\nRecognizes surgical complications and formulates an initial management plan',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Independently performs gynecologic procedures\n\nDemonstrates good intra-operative decision making, including the ability to modify a surgical plan based on operative findings\n\nDemonstrates the ability to recognize and manage surgical complications, including the appropriate use of intra-operative consultation\n\nApplies an evidence-based approach to the adoption of new technologies\n\nEffectively supervises and educates lower-level residents regarding laparotomy\n\nCollaborates and provides consultation to other members of the health care team regarding laparotomy and vaginal surgery',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applies innovative and complex approaches to laparotomy and implements treatment plans based',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '6.  Gynecology Technical Skills: Endoscopy (Laparoscopy, Hysteroscopy, Cystoscopy) —  Patient Care ',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates basic understanding of abdominal and pelvic anatomy\n\nDemonstrates basic surgical principles, including use of universal precautions and aseptic technique\n\nPositions patient appropriately for surgery',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Assembles ndoscopic instruments and checks proper functioning\n\nPerforms proper insertion of ndoscopic instruments\n\nDemonstrates an understanding of the indications for endoscopy',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Performs diagnostic procedures\n\nPerforms operative procedures\n\nDisplays appropriate tissue handling, request for instruments, and flow of the procedure\n\nUses various forms of energy sources used in surgery\n\nRecognizes complications and formulates an initial management plan',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Performs operative endoscopy independently (e.g., hysterectomy, myomectomy)\n\nDemonstrates good intra-operative decision making, including the ability to modify surgical plan based on operative findings\n\nRecognizes and manages surgical complications, including the appropriate use of intra-operative consultation\n\nApplies an evidence-based approach to the adoption of new technologies\n\nEffectively supervises and educates lower-level residents regarding endoscopy\n\nCollaborates and provides consultation to other members of the health care team regarding endoscopy',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applies innovative and complex approaches to endoscopy and implements treatment plans based on emerging evidence',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '7. Family Planning — Patient Care ',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Verbalizes basic knowledge about common contraceptive options',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Demonstrates a basic understanding of the effectiveness, risks, benefits, complications, and contraindications of contraception, including emergency contraception, and pregnancy termination',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Counsels on the effectiveness, risks, benefits, and contraindications of available forms of contraception\n\nCounsels on the effectiveness, risks, benefits, and contraindications for male and female sterilization\n\nPerforms intra-uterine and implantable contraceptive placement\n\nDemonstrates ability to perform basic first trimester uterine evacuation (medical and surgical)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Formulates comprehensive management plans for patients with medical diseases complicating their use of contraceptive methods\n\nManages complications of contraceptive methods and pregnancy termination\n\nDetermines the need for consultation, referral, or transfer of patients with complex complications\n\nDemonstrates ability to perform basic second trimester uterine evacuation (medical and surgical)',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Applies innovative and complex approaches to family planning and implements treatment plans based on emerging evidence',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '8.  Compassion, Integrity, and Respect for Others — Professionalism ',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Understands the importance of compassion, integrity, and respect for others\n\nDemonstrates sensitivity and responsiveness to patients',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Consistently shows compassion, integrity, and respect in typical situations with patients, peers, and members of the health care team\n\nConsistently demonstrates sensitivity and responsiveness to diversity of patients’ ages, cultures, races, religions, abilities, or sexual orientation\n\nAccepts constructive feedback to improve his or her ability to demonstrate compassion, integrity, and respect for others',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Consistently shows compassion, integrity, and respect for patients who decline medical advice or request un-indicated tests or treatments, for patients who have psychiatric comorbidities, and for team members in circumstances of conflict or high stress\n\nModifies one’s own behavior based on feedback to improve his or her ability to demonstrate compassion, integrity, and respect for others',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Consistently models compassion, integrity, and respect for others\n\nCoaches others to improve compassion, integrity, and respect for patients',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Assumes long-term or leadership role in community outreach activities to improve the health of vulnerable populations',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '9. Accountability and Responsiveness to the Needs of Patients, Society, and the Profession — Professionalism ',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Understands that physicians are accountable to patients, society, and the profession\n\nActs with honesty and truthfulness',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Is consistently punctual for clinical assignments and responsive to requests for assistance; completes dministrative duties (e.g., medical records, reports) on time and without reminders\n\nUnderstands the signs and symptoms of fatigue, stress, and substance abuse',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Serves as an example for others in punctuality, responsiveness, and timely completion of duties\n\nRecognizes signs and symptoms of fatigue, stress, and substance abuse',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Coaches others to improve punctuality and responsiveness; offers assistance to ensure patient care duties are completed in a timely fashion\n\nDemonstrates self-awareness of fatigue and stress, and mitigates the effects',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Participates in institutional or community peer counseling related to professionalism',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '10. Respect for Patient Privacy, Autonomy, Patient-Physician Relationship — Professionalism',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Understands the importance of respect for patient privacy and autonomy\n\nUnderstands the ethical principles of appropriate patient-physician relationships',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Shows respect for patient privacy\n\nElicits patient goals for care, and patient preferences regarding treatment alternatives\n\nDemonstrates an understanding of ethical principles, including boundary issues, and consciously applies them in patient care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Assesses a patient’s capacity for medical decision making\n\nSuccessfully navigates conflicts between patient preferences that are discordant with personal beliefs\n\nEfficiently counsels patients to help align treatment decisions with individual preferences',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Successfully navigates ethically complex clinical issues involving patient autonomy\n\nBalances patient privacy with ethical and legal requirements in complex circumstances',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Successfully leads others through complex and atypical clinical issues involving patient autonomy\n\nLongitudinally participates on hospital ethics committee',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '11. Communication with Patients and Families — Interpersonal and Communication Skills',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Demonstrates adequate listening skills\n\nCommunicates effectively in routine clinical situations',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Checks for patient and family understanding of illness and management plan\n\nAllows for opportunities for patient questions\n\nFor hospitalized patients, maintains communication with patient and family regarding plan of care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Communicates effectively in stressful, emergent, and complex situations\n\nCapable of delivering bad news to patients and families regarding poor prognoses\n\nCommunicates effectively with patients and families across a broad range of socio-economic and cultural backgrounds',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Delivers bad news to families about complications or death\n\nCapable of informing patients and families about a medical error that caused harm\n\nIncorporates risk management in this process\n\nRole models effective communication to junior colleagues\n\nParticipates in education of patients and families',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Capable of effective communication in the most challenging situations, and invites participation from all stakeholders',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '12. Communication with Physicians and Other Health Professionals and Teamwork — Interpersonal and Communication Skills',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Understands the importance of relationship development, information gathering and sharing, and teamwork',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Demonstrates an understanding of the roles of health care team members, and communicates effectively within the team\n\nDemonstrates an understanding of transitions of care and team debriefing',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Works effectively in Inter-professional and interdisciplinary health care teams\n\nParticipates in effective transitions of care and team debriefing\n\nCommunicates effectively with physicians and other health care professionals regarding patient care',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Leads inter-professional and interdisciplinary health care teams to achieve optimal outcomes\n\nLeads effective transitions of care and team debriefing\n\nResponds to requests for consultation in a timely manner and communicates recommendations to the requesting team',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Educates other health care professionals regarding obstetrics and gynecology\n\nProvides effective consultation in complex and atypical patients',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '13. Informed Consent and Shared Decision Making — Interpersonal and Communication  Skills',
              textScaleFactor: 1.5,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text(
                      'Level 1',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 2',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 3',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 4',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Level 5',
                      textScaleFactor: 1.2,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  rowSpacer,
                  TableRow(children: [
                    Text(
                      'Understands the importance of informed consent',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Begins to engage patients in shared decision making, and obtains informed consent for basic procedures',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Uses appropriate, easy-to-understand language in all phases of communication, utilizing an interpreter where necessary\n\nEngages in shared decision making, incorporating patients’ and families’ cultural frameworks\n\nObtains informed consent for complex procedures',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Organizes and participates in multidisciplinary family/patient/team member conferences',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Models and coaches shared decision making in complex and highly stressful situations\n\nLeads multidisciplinary family/patient/team member conferences',
                      textScaleFactor: 0.8,
                      //style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ]),
                  // rowSpacer,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
