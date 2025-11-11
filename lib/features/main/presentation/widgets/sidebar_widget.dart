import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              "NoCodeify",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () => context.go('/dashboard'),
            selected: _isActive(context, '/dashboard'),
          ),
          ExpansionTile(
            leading: const Icon(Icons.people),
            title: const Text('Accounts'),
            initiallyExpanded: _isActive(context, '/accounts'),
            children: [
              ListTile(
                title: const Text('Instagram'),
                onTap: () => context.go('/accounts/instagram'),
                selected: _isActive(context, '/accounts/instagram'),
                contentPadding: const EdgeInsets.only(left: 48),
              ),
              ListTile(
                title: const Text('Facebook'),
                onTap: () => context.go('/accounts/facebook'),
                selected: _isActive(context, '/accounts/facebook'),
                contentPadding: const EdgeInsets.only(left: 48),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chats'),
            onTap: () => context.go('/chat/all'),
            selected: _isActive(context, '/chat'),
          ),
        ],
      ),
    );
  }

  bool _isActive(BuildContext context, String path) {
    final location = GoRouterState.of(context).uri.toString();

    return location.contains(path);
  }
}
