import 'package:flutter/material.dart';
import 'package:social/helper/icon_broken.dart';

Widget buildPostItem(context){
  return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      elevation: 5.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      'https://image.freepik.com/free-photo/horizontal-shot-happy-blond-little-boy-poses-isolated-yellow-wearing-black-backwards-cap-green-shirt_176532-10133.jpg'),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Mohamed Nabil',
                              style: TextStyle(height: 1.4),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 16,
                            )
                          ],
                        ),
                        Text(
                          'January 21, 2021 at 11:00 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(height: 1.4),
                        )
                      ],
                    )),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                    icon: Icon(Icons.more_horiz), onPressed: () {}),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                height: 1.3,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      child: Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text('#software',style: TextStyle(color: Colors.blue),),
                          height: 20,
                          minWidth: 1,
                          padding: EdgeInsets.zero,
                        ),
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.freepik.com/free-photo/horizontal-shot-smiling-curly-haired-woman-indicates-free-space-demonstrates-place-your-advertisement-attracts-attention-sale-wears-green-turtleneck-isolated-vibrant-pink-wall_273609-42770.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Icon(IconBroken.Heart,size: 16,color: Colors.grey,),
                              SizedBox(width: 5,),
                              Text('120',style: Theme.of(context).textTheme.caption,)
                            ],
                          ),
                        ),
                      )),
                  Expanded(child: InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(IconBroken.Chat,size: 16,color: Colors.amber,),
                          SizedBox(width: 5,),
                          Text('120 comment',style: Theme.of(context).textTheme.caption,)
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(

                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18.0,
                          backgroundImage: NetworkImage(
                              'https://image.freepik.com/free-photo/horizontal-shot-happy-blond-little-boy-poses-isolated-yellow-wearing-black-backwards-cap-green-shirt_176532-10133.jpg'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'write a comment ... ',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(height: 1.4,fontSize: 15),
                        )
                      ],
                    ),
                    onTap: (){},
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Row(
                    children: [
                      Icon(IconBroken.Heart,size: 16,color: Colors.grey,),
                      SizedBox(width: 5,),
                      Text('like',style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: 14
                      ),)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ));
}