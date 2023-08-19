import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:kylipp/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../models/my_arrow_edge_renderer.dart';
import '../models/user.dart';
import '../providers/users_provider.dart';
import '../widgets/user_info.dart';

class ConnectionPage extends StatelessWidget {
  ConnectionPage({super.key});

  final Graph graph = Graph()..isTree = false;

  final FruchtermanReingoldAlgorithm builder = FruchtermanReingoldAlgorithm(
    repulsionRate: 2.1,
  );

  @override
  Widget build(BuildContext context) {
    Map<String, Node> nodes = {};
    Map<String, User> data = {};
    final usersProvider = Provider.of<UsersProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final users = usersProvider.users;
    final currentUser = userProvider.user;
    if (users != null && currentUser != null) {
      for (User user in users) {
        nodes.addAll({user.uid: Node.Id(user.uid)});
        data.addAll({user.uid: user});
      }
      nodes.addAll({
        currentUser.uid: Node.Id(currentUser.uid)
      }); //adding curent user to the map
      data.addAll({currentUser.uid: currentUser});
      for (User user in users) {
        if (user.following.isNotEmpty) {
          for (String uid in user.following) {
            Node? src = nodes[user.uid];
            Node? des = nodes[uid];
            if (src != null && des != null) {
              graph.addEdge(src, des,
                  paint: Paint()
                    ..color = Colors.yellow
                    ..strokeWidth = 5);
            }
          }
        }
      }
      for (var i = 0; i < currentUser.following.length; i++) {
        Node? src = nodes[currentUser.uid];
        Node? des = nodes[currentUser.following[i]];
        if (src != null && des != null) {
          graph.addEdge(src, des,
              paint: Paint()
                ..color = Colors.red
                ..strokeWidth = 5);
        }
      }
    }

    return Scaffold(
        body: users == null
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            : InteractiveViewer(
                constrained: false,
                child: GraphView(
                    graph: graph,
                    algorithm: FruchtermanReingoldAlgorithm(
                        renderer: MyArrowEdgeRenderer()),
                    builder: (Node node) {
                      return UserInfo(user: data[node.key!.value]!);
                    }),
              ));
  }
}
