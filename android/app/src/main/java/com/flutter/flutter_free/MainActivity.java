package com.flutter.flutter_free;

import android.os.Bundle;

import com.flutter.flutter_free.plugins.deviceinfo.DeviceInfoPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    DeviceInfoPlugin.registerWith(this.registrarFor("com.flutter.flutter_free.plugins.deviceinfo.DeviceInfoPlugin"));
  }
}
