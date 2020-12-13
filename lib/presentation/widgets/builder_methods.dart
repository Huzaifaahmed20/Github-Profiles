import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';

class BuilderMethods {
  BuilderMethods._();
  static Widget buildProfile(userInfo) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userInfo.avatar_url),
      ),
      title: Text(
        userInfo.name ?? '',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        userInfo.bio ?? '',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  static Widget buildFollowers(userInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            '${userInfo.followers} followers',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 20),
          Text(
            '${userInfo.following} following',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  static Widget buildReposGrid(List<ReposInfo> reposInfo) {
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
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Card(
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        e.name,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
