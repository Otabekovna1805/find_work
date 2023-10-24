import 'package:find_work/model/resume.dart';
import 'package:find_work/service/network_service.dart';
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  List<ResumeModel> items = [];

  void fetchResumes() async {
    final data = await Network.methodGet(api: Network.apiResumeList);
    items = Network.parseResumeList(data!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchResumes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final resume = items[i];
          return  ListTile(
            leading: Text(resume.id.toString(), style: Theme.of(context).textTheme.headlineSmall,),
            title: Text(resume.area, style:  Theme.of(context).textTheme.titleLarge,),
            subtitle: Text(resume.area, style: Theme.of(context).textTheme.labelMedium),
            trailing: Text(resume.title.toString(), style: Theme.of(context).textTheme.bodyMedium),
          );
        },
      ),
    );
  }
}


