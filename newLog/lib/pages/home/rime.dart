import 'package:flutter/material.dart';

class Rime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appendix 2: RIME Model'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new DefaultTextStyle(
              style: Theme.of(context).textTheme.headline6,
              child: new RichWidget()),
        ),
      ),
    );
  }
}

class RichWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RichText(
      textAlign: TextAlign.justify,
      textScaleFactor: 1.2,
      text: new TextSpan(
        //text: '',
        style: new TextStyle(
            color: Colors.black,),
        children: <TextSpan>[
          new TextSpan(
            text: 'RIME model for clinical learning\n\n ',
            style: new TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          new TextSpan(
            text:
                'The RIME model is used for describing the professional growth of medical trainees. Trainees can use it to monitor their own progress or to get appropriate feedback.\n\nDeveloped by Dr. Louis Pangaro, an internist and medical education expert at the Uniformed Services University of the Health Sciences, USA. As you progress through your residency you grow in knowledge, skills and attitudes and go through four stages: Reporter, Interpreter, Manager and Educator. These levels are described as follows:\n\n ',
            style: new TextStyle(color: Colors.black),
          ),
          new TextSpan(
            text: 'Reporter',
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new TextSpan(
              text:
                  '\n\nYou learn to gather information verbally, by examination of the patient and her investigations. You learn to communicate, sift relevant from irrelevant information, organise it in a coherent manner and document important issues central to the patient. All residents are expected to master this art by the end of year 1\n\n'),
          new TextSpan(
              text: 'Interpreter',
              style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(
            text:
                '\n\nOnce you have gathered the information you should be able to interpret it. You identify problems independently, prioritize them and include new problems, as they arise. You are able to have a provisional diagnosis, develop a differential diagnosis  and argue  for and against each of the differential diagnoses under consideration. All residents are expected to master this art by the end of year 1.\n\n',
            //style: new TextStyle(fontWeight: FontWeight.bold)
          ),
          new TextSpan(
            text: 'Manager',
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new TextSpan(
            text:
                '\n\nYou show the ability to develop a management plan for the patient. This includes confirmation of the provisional diagnosis with a diagnostic plan and development of a therapeutic plan. You should be able to identify the patients\' central problem and prioritise the required actions. You should be able to solve the patients\' problem after analysing the risk benefit ratio based on an individual patient\'s circumstances. By the end of year 2 all residents should reach this level.\n\n',
            //style: new TextStyle(fontWeight: FontWeight.bold, ),
          ),
          new TextSpan(
            text: 'Educator',
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new TextSpan(
            text:
                '\n\nEducators are masters of the fundamental skills described above. They should have the insight to identify their knowledge gaps, develop the habit of seeking evidence behind clinical practices, question any deviations observed and justify if they themselves deviate from standard management guidelines. They have the responsibility of educating themselves, the rest of the team including undergraduates, paramedical staff and their seniors. By the end of year 2 all residents should strive to reach this level.',
            //style: new TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
