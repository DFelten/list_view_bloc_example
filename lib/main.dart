import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_view_bloc_example/cubit/expansion_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<int, ExpansionCubit> expansionCubits = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View Example'),
      ),
      body: ListView.builder(
        itemCount: 150,
        itemBuilder: (_, index) => BlocProvider<ExpansionCubit>.value(
          value: _getCubitOrCreateNew(index),
          child: Entry(
            title: 'Item $index',
          ),
        ),
      ),
    );
  }

  ExpansionCubit _getCubitOrCreateNew(int item) {
    return expansionCubits.putIfAbsent(item, () => ExpansionCubit());
  }

  @override
  void dispose() {
    for (final ExpansionCubit cubit in expansionCubits.values) {
      cubit.close();
    }

    super.dispose();
  }
}

class Entry extends StatelessWidget {
  const Entry({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpansionCubit, ExpansionState>(
      builder: (context, state) {
        return InkWell(
          onTap: () => context.read<ExpansionCubit>().toggle(),
          child: ListTile(
            title: Text(title),
            subtitle: state is TileExpanded ? const Text('Hello World') : null,
          ),
        );
      },
    );
  }
}
