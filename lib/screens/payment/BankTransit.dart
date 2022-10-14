import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './PaymentSucessfulScreen.dart';
// import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class BankTransit extends StatefulWidget {
  dynamic htmlData;

  BankTransit({this.htmlData});

  @override
  State<BankTransit> createState() => _BankTransitState();
}

class _BankTransitState extends State<BankTransit> {
  @override
  WebViewController? _controller;
  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid)
    // WebView.platform = SurfaceAndroidWebView(); // <<== THIS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pay Now'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height *
                (MediaQuery.of(context).viewInsets.bottom != 0 ? .7 : 1),
            child: WebView(
              onWebViewCreated: (controller) {
                //controller.loadString(widget.htmlData!.toString());
                controller.loadFile(widget.htmlData.toString());
                _controller = controller;
              },
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                if (request.url
                    .startsWith('https://stage.app.investifyd.com/')) {
                  print('blocking navigation to $request}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentSucessfulSceen()));
                  return NavigationDecision.prevent;
                }

                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
            )));
    // WebViewPlus(
    //   javascriptMode: JavascriptMode.unrestricted,
    //   // onWebViewCreated: (controller) {
    //   //   //controller.loadString(widget.htmlData!.toString());
    //   //   controller.loadString(
    //   //       '<!DOCTYPE html><html lang="en"> <head> <meta charset="UTF-8"/> <meta http-equiv="X-UA-Compatible" content="IE=edge"/> <meta name="viewport" content="width=device-width, initial-scale=1.0"/> <title>Document</title> </head> <body> <h1> Redirection automatique dans <span id="counter">10</span> seconde(s) </h1> <button type="button" id="redirect" onclick="window.location.href=\'https\://codepen.io\'" > Retour à l\'acceuil </button> <script>var counterElt=document.getElementById("counter"); function decreaseCounter(){var counter=Number(counterElt.textContent); if (counter > 1){counterElt.textContent=counter - 1;}else{clearInterval(intervalId); var titre=document.getElementById("redirect"); titre.click();}}var intervalId=setInterval(decreaseCounter, 1000); </script> </body></html>');
    //   //   _controller = controller;
    //   // },
    //   // onPageFinished: (webview) {
    //   //   print('webview');
    //   //   print(webview);
    //   // },
    //   initialUrl: "http://127.0.0.1:5500/index.html",
    //   navigationDelegate: (dynamic request) {
    //     if (request.url
    //         .startsWith('https://stage.app.investifyd.com/')) {
    //       print('blocking navigation to $request}');
    //
    //       // return NavigationDecision.prevent;
    //     }
    //
    //     print('allowing navigation to $request');
    //     return NavigationDecision.navigate;
    //   },
    // )));
  }
}
