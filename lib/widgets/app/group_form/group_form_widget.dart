import 'package:flutter/material.dart';
import 'package:todo_list/widgets/app/group_form/group_form_widget_model.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({Key? key}) : super(key: key);

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final _model = GroupFormWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelProvider(
        model: _model, child: const _GroupFormWidgetBody());
  }
}

class _GroupFormWidgetBody extends StatelessWidget {
  const _GroupFormWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новая запись"),
        centerTitle: true,
      ),
      body: const Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _GroupNameWidget(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GroupFormWidgetModelProvider.read(context)
            ?.model
            .saveGroup(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GroupFormWidgetModelProvider.read(context)?.model;
    return TextField(
      autofocus: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Введите новую запись'),
      onChanged: (value) => model?.groupName = value, //save text
      onEditingComplete: () => model?.saveGroup(context),
    );
  }
}
