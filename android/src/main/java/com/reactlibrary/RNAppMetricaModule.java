
package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RNAppMetricaModule extends ReactContextBaseJavaModule {
  final static String ModuleName = "RNAppMetrica";

  private final ReactApplicationContext reactContext;

  public RNAppMetricaModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return ModuleName;
  }

  @ReactMethod
    public void activateWithApiKey(String key) {
        YandexMetricaConfig config = YandexMetricaConfig.newConfigBuilder(key).build();
        activeTracking(config);
    }

    @ReactMethod
    public void activateWithConfig(ReadableMap params) {
        YandexMetricaConfig.Builder configBuild = YandexMetricaConfig.newConfigBuilder(params.getString("ApiKey"));

        if (params.hasKey("sessionTimeout")) {
            configBuild.withSessionTimeout(params.getInt("sessionTimeout"));
        }

        if (params.hasKey("firstActivationAsUpdate")) {
            configBuild.handleFirstActivationAsUpdate(params.getBoolean("firstActivationAsUpdate"));
        }

        if (params.hasKey("logs")) {
            configBuild.withLogs();
        }

        YandexMetricaConfig config = configBuild.build();

        activeTracking(config);
    }

    @ReactMethod
    public void reportEvent(String message, @Nullable ReadableMap params) {
        if (params != null) {
            YandexMetrica.reportEvent(message, convertReadableMapToJson(params));
        } else {
            YandexMetrica.reportEvent(message);
        }
    }

    private void activeTracking(YandexMetricaConfig config) {
        YandexMetrica.activate(getReactApplicationContext().getApplicationContext(), config);

        Activity activity = getCurrentActivity();

        if (activity != null) {
            Application application = activity.getApplication();
            YandexMetrica.enableActivityAutoTracking(application);
        }
    }

    private String convertReadableMapToJson(final ReadableMap readableMap) {
        JSONObject jsonObject = new JSONObject();

        ReadableMapKeySetIterator iterator = readableMap.keySetIterator();

        try {
            while (iterator.hasNextKey()) {
                String key = iterator.nextKey();
                ReadableType type = readableMap.getType(key);

                switch (type) {
                    case Null:
                        jsonObject.put(key, null);
                        break;
                    case Boolean:
                        jsonObject.put(key, readableMap.getBoolean(key));
                        break;
                    case Number:
                        jsonObject.put(key, readableMap.getDouble(key));
                        break;
                    case String:
                        jsonObject.put(key, readableMap.getString(key));
                        break;
                    case Map:
                        jsonObject.put(key, convertReadableMapToJson(readableMap.getMap(key)));
                        break;
                    case Array:
                        jsonObject.put(key,readableMap.getArray(key));
                        break;
                }
            }

        } catch (Exception ex) {
            Log.d(ModuleName, "convertReadableMapToJson fail: " + ex);
        }


        return jsonObject.toString();
    }
}