import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teqexpert_assingnment/features/userdata/presention/cubit/user_cubit/user_cubit.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

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
              itemCount: state.data?.length ?? 0,
              itemBuilder: (context, index) {
                var user = state.data![index];
                return ListTile(
                  title: Text(user.title ?? ""),
                  subtitle: Text(user.body ?? ""),
                );
              },
            );
          } else if (state.isError) {
            return Center(child: Text("Error: ${state.errorMessage}"));
          } else {
            return const Center(child: Text("Press the button to load users"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserCubit>().fetchUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
