package com.example.petfeed;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;
import java.util.HashMap;

import com.pusher.client.Pusher;
import com.pusher.client.util.HttpAuthorizer;
import com.pusher.client.PusherOptions;
import com.pusher.client.channel.PrivateChannel;
import com.pusher.client.channel.PrivateChannelEventListener;

public class MainActivity extends FlutterActivity {

  String PUSHER_INITIALIZE = "petfeed/pusher-initialize";
  String PUSHER_STATUS = "petfeed/pusher-status";
  String PUSHER_DISPOSE = "petfeed/pusher-dispose";
  String PUSHER_CONFIGURE_STATUS = "petfeed/pusher-configure-status";

  HashMap<String, String> pusherEventData;
  String pusherEvent;
  String pusherData;

  PusherOptions options;
  Pusher pusher;
  PrivateChannel channel;
  HttpAuthorizer authorizer;

  boolean pusherConnection = false;

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
            HashMap<String, String> headers = new HashMap<String, String>();

            headers.put("Authorization", "Bearer " + pusherConfig.get("token"));
            headers.put("Accept", "application/json");

            options = new PusherOptions();
            authorizer = new HttpAuthorizer(pusherConfig.get("auth"));
            authorizer.setHeaders(headers);

            options.setCluster(pusherConfig.get("cluster"));
            options.setAuthorizer(authorizer);
            pusher = new Pusher(pusherConfig.get("key"), options);
            channel = pusher.subscribePrivate("private-" + pusherConfig.get("channel"),
                new PrivateChannelEventListener() {
                  @Override
                  public void onAuthenticationFailure(String message, Exception e) {
                    System.out
                        .println(String.format("Authentication failure due to [%s], exception was [%s]", message, e));
                  }

                  @Override
                  public void onSubscriptionSucceeded(String channelName) {
                    System.out.println("Subscribed to channel: " + channelName);
                  }

                  @Override
                  public void onEvent(String channelName, String eventName, String data) {
                    // Called for incoming events named "my-event"
                  }
                });
            pusher.connect();
            pusherConnection = true;
          } catch (Exception e) {
            e.printStackTrace();
            pusherConnection = false;
            System.out.println("Exception occured!!!!");
          }
        } else if (call.method.equals("pusher-dispose")) {
          try {
            pusher.disconnect();
          } catch (Exception e) {

          }
        } else if (call.method.equals("pusher-status")) {
          result.success(pusherConnection);
        } else if (call.method.equals("pusher-trigger")) {
          pusherEventData = (HashMap<String, String>) call.arguments;
          pusherEvent = "client-" + pusherEventData.get("event");
          pusherData = pusherEventData.get("data");
          channel.trigger(pusherEvent, pusherData);
        } else {
          result.notImplemented();
        }
      }
    });

    new EventChannel(getFlutterView(), PUSHER_STATUS).setStreamHandler(new EventChannel.StreamHandler() {
      @Override
      public void onListen(Object args, EventChannel.EventSink events) {
        try {
          // System.out.println("WTF");
          channel.bind("petfeed-pi-status", new PrivateChannelEventListener() {
            @Override
            public void onAuthenticationFailure(String message, Exception e) {
              System.out.println(String.format("Authentication failure due to [%s], exception was [%s]", message, e));
            }

            @Override
            public void onSubscriptionSucceeded(String channelName) {
              System.out.println("Subscribed to channel: " + channelName);
            }

            @Override
            public void onEvent(String channelName, String eventName, final String data) {
              System.out.println("I am trying to figure this shit");
              // System.out.println(deviceStatus);
              events.success(data);
            }
          });
        } catch (Exception e) {
          e.printStackTrace();
        }
      }

      @Override
      public void onCancel(Object args) {
        channel.unbind("petfeed-pi-status", new PrivateChannelEventListener() {
          @Override
          public void onAuthenticationFailure(String message, Exception e) {
            System.out.println(String.format("Authentication failure due to [%s], exception was [%s]", message, e));
          }

          @Override
          public void onSubscriptionSucceeded(String channelName) {
            System.out.println("Subscribed to channel: " + channelName);
          }

          @Override
          public void onEvent(String channelName, String eventName, final String data) {
            System.out.println("Unbined");
          }
        });
      }
    });

    new EventChannel(getFlutterView(), PUSHER_CONFIGURE_STATUS).setStreamHandler(new EventChannel.StreamHandler() {
      @Override
      public void onListen(Object args, EventChannel.EventSink events) {
        try {
          // System.out.println("WTF");
          channel.bind("petfeed-pi-configure", new PrivateChannelEventListener() {
            @Override
            public void onAuthenticationFailure(String message, Exception e) {
              System.out.println(String.format("Authentication failure due to [%s], exception was [%s]", message, e));
            }

            @Override
            public void onSubscriptionSucceeded(String channelName) {
              System.out.println("Subscribed to channel: " + channelName);
            }

            @Override
            public void onEvent(String channelName, String eventName, final String data) {
              // System.out.println("I am trying to figure this shit");
              // System.out.println(deviceStatus);
              events.success(data);
            }
          });
        } catch (Exception e) {
          e.printStackTrace();
        }
      }

      @Override
      public void onCancel(Object args) {
        channel.unbind("petfeed-pi-configure", new PrivateChannelEventListener() {
          @Override
          public void onAuthenticationFailure(String message, Exception e) {
            System.out.println(String.format("Authentication failure due to [%s], exception was [%s]", message, e));
          }

          @Override
          public void onSubscriptionSucceeded(String channelName) {
            System.out.println("Subscribed to channel: " + channelName);
          }

          @Override
          public void onEvent(String channelName, String eventName, final String data) {
            // System.out.println("Unbined");
          }
        });
      }
    });

  }
}
