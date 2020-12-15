import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/routes/app_routes.dart';

class ReposGrid extends StatelessWidget {
  final List<ReposInfo> reposInfo;

  const ReposGrid({
    Key key,
    this.reposInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: reposInfo == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: reposInfo.map((e) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.reposWebView,
                        arguments: e.html_url);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Card(
                      color: Colors.black,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.name,
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
