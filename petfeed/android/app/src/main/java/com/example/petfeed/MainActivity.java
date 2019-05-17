package com.example.petfeed;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.StringReader;
import java.io.ByteArrayInputStream;
import java.util.HashMap;

import com.pusher.client.Pusher;
import com.pusher.client.PusherOptions;
import com.pusher.client.channel.Channel;
import com.pusher.client.channel.SubscriptionEventListener;

public class MainActivity extends FlutterActivity {

  String PUSHER_INITIALIZE = "petfeed/pusher-initialize";
  String PUSHER_STATUS = "petfeed/pusher-status";
  String PUSHER_DISPOSE = "petfeed/pusher-dispose";

  PusherOptions options;
  Pusher pusher;
  Channel channel;

  String deviceStatus;
  BufferedReader deviceStatusReader;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), PUSHER_INITIALIZE).setMethodCallHandler(new MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("pusher-initialize")) {
          try {
            HashMap<String, String> pusherConfig = (HashMap<String, String>) call.arguments;
            options = new PusherOptions();
            options.setCluster(pusherConfig.get("cluster"));
            pusher = new Pusher(pusherConfig.get("key"), options);
            channel = pusher.subscribe(pusherConfig.get("channel"));
            pusher.connect();
          } catch (Exception e) {
            e.printStackTrace();
          }
        } else if (call.method.equals("pusher-dispose")) {
          try {
            pusher.disconnect();
          } catch (Exception e) {

          }
        } else {
          result.notImplemented();
        }
      }
    });

    new EventChannel(getFlutterView(), PUSHER_STATUS).setStreamHandler(new EventChannel.StreamHandler() {
      @Override
      public void onListen(Object args, EventChannel.EventSink events) {
        try {
          System.out.println("WTF");
          channel.bind("petfeed-pi-status", new SubscriptionEventListener() {
            @Override
            public void onEvent(String channelName, String eventName, final String data) {
              deviceStatus = data;
              System.out.println("I am trying to figure this shit");
              System.out.println(deviceStatus);
              events.success(data);
            }
          });
        } catch (Exception e) {
          e.printStackTrace();
        }
      }

      @Override
      public void onCancel(Object args) {
        channel.unbind("petfeed-pi-status", new SubscriptionEventListener() {
          @Override
          public void onEvent(String channelName, String eventName, final String data) {
            System.out.println("Unbined");
          }
        });
      }
    });

  }
}
