import 'package:ecommerce_flutter/models/Categories.dart';
import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:ecommerce_flutter/shared/components/component/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit, AppState>(
      listener: (context, state) {},
      builder: (context, state)
      {
        Appcubit cubit = Appcubit.get(context);
        return ListView.separated(
          itemBuilder: (context, index) => buildCatItem(Appcubit.get(context).categoriesModel!.data!.data![index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: cubit.categoriesModel!.data!.data!.length,
        );
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        Image(
          image: NetworkImage(model.image!),
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          model.name!,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),
      ],
    ),
  );
  }

