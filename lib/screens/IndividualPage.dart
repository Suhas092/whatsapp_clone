
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/scratchcard/OwnMessageCard.dart';
import 'package:whatsapp_clone/scratchcard/ReplyCard.dart';
import '../models/MessageModel.dart';
import '../models/chatmodel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, this.chatModel,required this.sourchat});

  final ChatModel? chatModel;
  final ChatModel sourchat;



  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  TextEditingController _controller = TextEditingController();
  bool sendButton =false;
  List<MessageModel> messages=[];
  ScrollController _scrollController=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    // Connect to the Socket.IO server
    socket = IO.io("http://192.168.0.118:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    // Connect to the server
    socket.connect();

    // Handle the onConnect event
    socket.onConnect((data) {
      print("Connected");
      // Emit the "signin" event to the server after connecting
      socket.emit("signin", widget.sourchat.id);
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination",msg["message"]);
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut);
      });


    });
    // Check if the socket is connected
    print(socket.connected);

    // Listen for the "test" event from the server
    socket.on("test", (msg) {
      print("Received message from server: $msg");
    });
  }

  void sendMessage(String message, int? sourceId,int? targetId){
    setMessage("source",message);
    socket.emit(
      "message",{
        "message":message,
        "sourceId":sourceId,
        "targetId":targetId
      }
    );
  }

  void setMessage(String type, String message){
    MessageModel messageModel= MessageModel(
      type: type,
      message: message,
      time: DateTime.now().toString().substring(10,16));
      setState(() {
        setState(() {
          messages.add(messageModel);
        });
      });
  }





  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.blue.withOpacity(0.5), // Adjust the opacity here (0.0 to 1.0)
            BlendMode.dstATop,
          ),
          child: Image.asset(
            "assets/strawhats.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel?.isGroup
                          ??  false
                      ?'assets/groups.svg'
                          : 'assets/person.svg',
                      color: Colors.white,
                      height: 36,
                      width: 36,
                    ),
                    radius: 20,
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
            title: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel?.name ?? "",
                    style: TextStyle(
                      fontSize: 18.5,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'last seen at 12:00pm',
                    style: TextStyle(
                      fontSize: 13.5,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext contesxt) {
                return [
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("Media, links, and docs"),
                    value: "Media, links, and docs",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute notifications"),
                    value: "Mute notifications",
                  ),
                  PopupMenuItem(
                    child: Text("Disappearing messages"),
                    value: "Disappearing messages",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                  PopupMenuItem(
                    child: Text("More"),
                    value: "More",
                  ),
                ];
              }),
            ],
          ),
          body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height, //to get the screen height
            width: MediaQuery
                .of(context)
                .size
                .width,

            child: WillPopScope(
              child: Column(
                //to place text box upon container box
                children: [
                  Expanded(
                   //height: MediaQuery.of(context).size.height -145,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length+1,
                      itemBuilder: (context,index){
                        if(index==messages.length){
                          return Container(height:70);
                        }
                        if(messages[index].type=="source"){
                          return OwnMessageCard(
                            message: messages[index].message,
                            time:messages[index].time);
                        }else{
                          return ReplyCard(
                            message: messages[index].message,
                            time:messages[index].time);
                        }
                      },

                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                //height: MediaQuery.of(context).size.height, //to get the screen height
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width - 60,
                                  child: Card(
                                    margin:
                                    EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    child: TextFormField(
                                      //controller: messageController,
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical: TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      onChanged: (value){
                                        if(value.length>0){
                                          setState(() {
                                            sendButton =true;
                                          });
                                        }else{
                                          setState(() {
                                            sendButton =false;
                                          });

                                        }
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Type a message',
                                          prefixIcon: IconButton(
                                            icon: Icon(Icons.emoji_emotions),
                                            onPressed: () {
                                              setState(() {
                                                focusNode.unfocus();
                                                focusNode.canRequestFocus = false;
                                                show = !show;
                                              });
                                            },
                                          ),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        backgroundColor: Colors.transparent,
                                                        context: context, builder: (builder)=>bottomsheet());
                                                  },
                                                  icon: Icon(Icons.attach_file)),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.camera_alt)),
                                            ],
                                          ),
                                          contentPadding: EdgeInsets.all(5)),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 08,
                                  left: 05,
                                  right: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  //backgroundColor: Colors.blue,
                                  child: IconButton(
                                    icon: Icon(
                                        sendButton?Icons.send: Icons.mic),
                                    onPressed: () {
                                      if(sendButton){
                                        _scrollController.animateTo(
                                        _scrollController.position.maxScrollExtent,
                                            duration: Duration(milliseconds: 300),
                                            curve: Curves.easeOut);
                                        sendMessage(_controller.text,
                                            widget.sourchat?.id,
                                            widget.chatModel?.id,

                                        );_controller.clear();
                                        setState(() {
                                          sendButton=false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show
                              ? SizedBox(height: 300, child: emojiSelect())
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomsheet(){
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                    Icons.insert_drive_file,Colors.red,"Docuement"),
                  SizedBox(width: 40,),
                  iconcreation(
                    Icons.camera_alt_rounded,Colors.green,"Camera"),
                  SizedBox(width: 40,),
                  iconcreation(
                    Icons.insert_photo_rounded ,Colors.orange,"Gallery"),
              ],),

              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.headphones ,Colors.purpleAccent,"Audio"),
                  SizedBox(width: 40,),
                  iconcreation(
                      Icons.location_on_outlined,Colors.yellow,"Location"),
                  SizedBox(width: 40,),
                  iconcreation(
                      Icons.insert_photo_rounded ,Colors.blue,"Contact"),
                ],),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text){
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              //Icons.insert_drive_file,
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text,style: TextStyle(
            fontSize: 12,
          ),),
        ],
      ),
    );
  }


  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji? emoji) {
        if (emoji != null && emoji.emoji != null) {
          setState(() {
            _controller.text = _controller.text + emoji.emoji!;
          });
        }
      },
      onBackspacePressed: () {
        // Do something when the user taps the backspace button (optional)
      },
      config: Config(
        // Your configuration...
      ),
    );
  }
}
