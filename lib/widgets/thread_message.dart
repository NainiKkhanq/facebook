import 'package:flutter/material.dart';

class ThreadMessage extends StatelessWidget {
  const ThreadMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://t3.ftcdn.net/jpg/05/54/79/98/360_F_554799811_UzZU63BgMMArG6k8JChnQkeHzRbp3DMJ.jpg"),
              radius: 25,
            ),
           const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    const  Text(
                        "Newton Jane",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                 const     Spacer(),
                  const    Text(
                        "5 Min",
                      ),
                      IconButton(onPressed: (){}, icon:const  Icon(Icons.more_horiz))
                    ],
                  ),
        
        
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Hi Everyone how are you all ?"),
        
                      Row(children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.mode_comment_outlined)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.restart_alt_outlined)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                      ],)
                    ],
                  ),
        
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
