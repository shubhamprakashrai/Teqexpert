// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:teqexpert_assingnment/features/userdata/presention/cubit/user_cubit/user_cubit.dart';


// class UserScreen extends StatelessWidget {
//   const UserScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Users List')),
//       body: BlocBuilder<UserCubit, UserDataState>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state.isLoaded) {
//             return ListView.builder(
//               itemCount: state.data?.length ?? 0,
//               itemBuilder: (context, index) {
//                 var user = state.data![index];
//                 return ListTile(
//                   title: Text(user.title ?? ""),
//                   subtitle: Text(user.body ?? ""),
//                 );
//               },
//             );
//           } else if (state.isError) {
//             return Center(child: Text("Error: ${state.errorMessage}"));
//           } else {
//             return const Center(child: Text("Press the button to load users"));
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.read<UserCubit>().fetchUsers(),
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teqexpert_assingnment/features/userdata/presention/cubit/user_cubit/user_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    // Call API when the page loads
    context.read<UserCubit>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: BlocBuilder<UserCubit, UserDataState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.isLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.data?.length ?? 0,
              itemBuilder: (context, index) {
                var user = state.data![index];
                return _buildUserCard(user.title ?? "", user.body ?? "");
              },
            );
          } else if (state.isError) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          } else {
            return const Center(child: Text("No users available"));
          }
        },
      ),
    );
  }

  /// 🌟 Stylish Card for Users
  Widget _buildUserCard(String title, String body) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
