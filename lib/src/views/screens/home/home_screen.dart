import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/src/models/experience.dart';
import 'package:portfolio/src/views/screens/home/widgets/horizontal_timeline.dart';
import 'package:portfolio/src/widgets/rounded_image_widget.dart';
import 'package:timelines/timelines.dart';
import 'dart:html' as html;

class HomeScreen extends StatelessWidget {
  final Color _purpleColor = Color(0xFF750FF7);
  final Color _backGroundColor = Color(0xFFFFFFFF);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _navBar(context),
            _banner(context),
            SizedBox(
              height: 900,
              child: Stack(
                alignment: Alignment.center,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                clipBehavior: Clip.hardEdge,
                children: [
                  _description(),
                  _skills(),
                ],
              ),
            ),
            _courses(context),
            _experiences(),
          ],
        ),
      ),
    );
  }

  Widget _navBar(BuildContext context) {
    return Container(
      color: _backGroundColor,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10, vertical: 15),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: Text("Louis-Marie .", style: TextStyle(color: _purpleColor, fontSize: 40, fontWeight: FontWeight.bold))),
          Center(
            child: Row(
              children: [
                InkWell(
                    onTap: () => html.window.open("https://github.com/obloow", "_blank"),
                    child: Text("Projects", style: TextStyle(color: Colors.black54, fontSize: 17, fontWeight: FontWeight.bold))),
                SizedBox(width: 20),
                TextButton(
                  onPressed: () => null,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Say Hello", style: TextStyle(fontSize: 18, color: _purpleColor)),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0), side: BorderSide(color: _purpleColor, width: 2)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _banner(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: MediaQuery.of(context).size.width / 10),
      child: Column(
        children: [
          Text("Entrepreneur & Software Engineer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          SizedBox(height: 25),
          Text("I’m a human mind converter, and I love what I do.", style: TextStyle(fontSize: 25, color: Colors.grey)),
          SizedBox(height: 100),
          Card(
            elevation: 10,
            shape: CircleBorder(),
            child: RoundedAssetImageWidget(size: 250, path: "assets/images/wankul.png"),
          ),
          SizedBox(height: 50),
          TextButton(
            onPressed: () => null,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Download my resume", style: TextStyle(fontSize: 18, color: _purpleColor)),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0), side: BorderSide(color: _purpleColor, width: 2)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _description() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 580,
        child: Container(
          color: _purpleColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("Hi, I’m Louis-Marie. Nice to meet you.", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                Text(
                  "Since beginning my journey as a Software Engineer nearly 10 years ago, I've done work for French Air & Space Force, went back to school, built Startup and collaborated with talented people to create digital products for both business and consumer use. I'm quietly confident, naturally curious, and perpetually working on improving my skills.",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _skills() {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      height: 500,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 100),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Icon(Icons.lightbulb, color: _purpleColor, size: 80),
                    SizedBox(height: 30),
                    Text("Entrepreneur", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 30,
                      child:
                          Text("I value simple content structure, clean design patterns, and thoughtful interactions.", textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 50),
                    Text("Things I enjoy imagine :", style: TextStyle(fontSize: 17, color: _purpleColor)),
                    SizedBox(height: 20),
                    Text("UX, UI, Web, Mobile, Apps, Logos", textAlign: TextAlign.center),
                    SizedBox(height: 50),
                    Text("My productivity tools :", style: TextStyle(fontSize: 17, color: _purpleColor)),
                    SizedBox(height: 20),
                    Text("UX, UI, Web, Mobile, Apps, Logos", textAlign: TextAlign.center),
                  ],
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Icon(Icons.code, color: _purpleColor, size: 80),
                    SizedBox(height: 30),
                    Text("Software Engineer", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 30,
                      child:
                          Text("I like to code things from scratch, and enjoy bringing ideas to life in the browser.", textAlign: TextAlign.center),
                    ),
                    SizedBox(height: 50),
                    Text("Things I enjoy imagine :", style: TextStyle(fontSize: 17, color: _purpleColor)),
                    SizedBox(height: 20),
                    Text("UX, UI, Web, Mobile, Apps, Logos", textAlign: TextAlign.center),
                    SizedBox(height: 50),
                    Text("My productivity tools :", style: TextStyle(fontSize: 17, color: _purpleColor)),
                    SizedBox(height: 20),
                    Text("UX, UI, Web, Mobile, Apps, Logos", textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _courses(BuildContext context) {
    return Column(
      children: [
        Text("My school journey", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
        SizedBox(height: 20),
        SizedBox(
          height: 430,
          width: double.infinity,
          child: ProcessTimelinePage(),
        ),
      ],
    );
  }

  Widget _experiences() {
    List<Experience> experiences = [
      Experience(
        title: "Associate & Chief Technology Officer",
        company: "Clippr",
        date: "Oct 2020 - Jan 2022 · 1 yr 4 mos",
        place: "Villejuif, Île-de-France, France",
        description:
            "Clippr is a solution for connecting independent hairdressers/barbers with customers.\n\nI participated in the founding of the proposed solution, a cross-platform application (made in Flutter and Firebase) for hairdressers and customers to simplify the management of appointments.\n\nObjectives of the mission:\n- Supervise and participate in project development\n- Implementation of the development and deployment environment\n- Study and choice of technologies to be used\n- R&D",
        image: "assets/images/clippr.jpeg",
        companyUrl: "https://www.clippr.fr/",
      ),
      Experience(
        title: "Software Engineer (Android development)",
        company: "Hager Group · Internship",
        date: "Apr 2021 - Sep 2021 · 6 mos",
        place: "Paris, Île-de-France, France",
        description:
            "Internship as native Android developer.\nMissions:\n- industrialization of development processes\n- build a toolkit SDK according the company specs (graphical, good practices) \n- build a sample app to demonstrate the use of the sdk \n- implement unit and instrumented tests",
        image: "assets/images/hager.jpeg",
        companyUrl: "https://hager.com/fr",
      ),
      Experience(
        title: "Software Engineer (Data Quality & Data Lineage research)",
        company: "Synaltic · Internship",
        date: "Aug 2020 · 1 mo",
        place: "Vincennes, Île-de-France, France",
        description:
            "Study on the implementation of a data quality and monitoring process in a decision-making environment.\nTools used and studied:\n- Marquez\n- Great Expectations\n- Apache Airflow\n\nAll in an environment including Docker and Talend.",
        image: "assets/images/synaltic.jpeg",
        companyUrl: "https://www.synaltic.fr/",
      ),
      Experience(
        title: "Data Engineer",
        company: "Armée de l'Air et de l'Espace",
        date: "Dec 2015 - Jul 2019 · 3 yrs 8 mos",
        place: "Vélizy-Villacoublay, Île-de-France, France",
        description:
            "- Non-commissioned Officer\n- Business Intelligence Trainer\n- Needs Analyst & IS/BDD\n- Data warehouse modelling & design\n- Job development, optimization & correction\n- Summary creation & dashboard",
        image: "assets/images/aa.png",
        companyUrl: "https://air.defense.gouv.fr/",
      ),
    ];
    return Container(
      margin: EdgeInsets.only(top: 80),
      padding: EdgeInsets.symmetric(vertical: 50),
      color: _purpleColor,
      width: double.infinity,
      child: Column(
        children: [
          Text("My experiences", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          FixedTimeline.tileBuilder(
            builder: TimelineTileBuilder.connected(
              contentsAlign: ContentsAlign.alternating,
              contentsBuilder: (context, index) {
                Experience experience = experiences[index];
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(experience.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: _purpleColor)),
                        SizedBox(height: 5),
                        Text(experience.company, style: TextStyle(fontSize: 18)),
                        SizedBox(height: 1),
                        Text(experience.date, style: TextStyle(fontSize: 15, color: Colors.grey)),
                        SizedBox(height: 1),
                        Text(experience.place, style: TextStyle(fontSize: 15, color: Colors.grey)),
                        SizedBox(height: 20),
                        Text(experience.description, style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                );
              },
              connectorBuilder: (context, index, type) {
                return SolidLineConnector(color: Colors.white);
              },
              indicatorBuilder: (context, index) => InkWell(
                onTap: () => html.window.open(experiences[index].companyUrl, "_blank"),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white),
                      child: SizedBox(child: Image.asset(experiences[index].image), width: 150)),
                ),
              ),
              itemCount: experiences.length,
            ),
          )
        ],
      ),
    );
  }
}
