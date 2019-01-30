package com.example.demo;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements MethodChannel.MethodCallHandler {
	private static final String CHANNEL = "com.wkswind.demo/battery";
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		GeneratedPluginRegistrant.registerWith(this);
		new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(this);
	}

	@Override
	public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
		if(methodCall.method.equals("getBatteryLevel")) {
			int level = getBatterylevel();
			if(level != -1) {
				result.success(level);
			}else {
				result.error("UNAVAILABLE", "Battery level not available", null);
			}
		}else {
			result.success(methodCall.method+" was invoked");
		}
	}

	private int getBatterylevel() {
		int level = -1;
		if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
			BatteryManager bm = (BatteryManager) getSystemService(Context.BATTERY_SERVICE);
			level = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY) * 100;
		}else {
			Intent intent = new ContextWrapper(getApplicationContext()).
				registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
			level = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
				intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
		}
		return level;
	}
}
