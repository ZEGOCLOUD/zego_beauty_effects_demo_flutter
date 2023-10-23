package im.zego.zego_faceunity_plugin;

import android.content.Context;

import androidx.annotation.NonNull;

import com.faceunity.FURenderer;

import im.zego.zegoexpress.ZegoExpressEngine;
import im.zego.zegoexpress.constants.ZegoVideoBufferType;
import im.zego.zegoexpress.entity.ZegoCustomVideoProcessConfig;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


import im.zego.zego_express_engine.internal.ZegoUtils;
import im.zego.zego_express_engine.ZegoCustomVideoCaptureManager;

/** ZegoFaceunityPlugin */
public class ZegoFaceunityPlugin implements FlutterPlugin, MethodCallHandler, FURenderer.OnTrackingStatusChangedListener {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context mContext;

  void setFlutterContext(Context context) {
    mContext = context;
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "zego_faceunity_plugin");
    channel.setMethodCallHandler(this);

    Context appContext = flutterPluginBinding.getApplicationContext();

    onCreate(appContext);
    this.setFlutterContext(appContext);
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "zego_faceunity_plugin");
    ZegoFaceunityPlugin plugin = new ZegoFaceunityPlugin();
    plugin.setFlutterContext(registrar.context());
    channel.setMethodCallHandler(new ZegoFaceunityPlugin());
  }

  protected FURenderer mFURenderer;
  protected VideoFilterByProcess2 videoFilterByProcess;
  public void onCreate(Context context){
    FURenderer.initFURenderer(context);
    mFURenderer = new FURenderer
            .Builder(context)
            .maxFaces(4)
            .inputTextureType(0)
            .setOnTrackingStatusChangedListener(this)
            .build();
    videoFilterByProcess = new VideoFilterByProcess2(mFURenderer);
  }
  Boolean inited = false;
  public void init() {
    if(inited) {
      return;
    }
//    onSurfaceCreated onSurfaceDestroyed
    inited = true;

    mFURenderer.onSurfaceCreated();
    ZegoCustomVideoProcessConfig zegoCustomVideoProcessConfig =new ZegoCustomVideoProcessConfig();
    zegoCustomVideoProcessConfig.bufferType = ZegoVideoBufferType.GL_TEXTURE_2D;
    ZegoExpressEngine.getEngine().enableCustomVideoProcessing(true,zegoCustomVideoProcessConfig);
    ZegoExpressEngine.getEngine().setCustomVideoProcessHandler(videoFilterByProcess);
  }
  public void uninit() {
    if(!inited) {
      return;
    }
    mFURenderer.onSurfaceDestroyed();
    inited = false;
    ZegoCustomVideoProcessConfig zegoCustomVideoProcessConfig =new ZegoCustomVideoProcessConfig();
    zegoCustomVideoProcessConfig.bufferType = ZegoVideoBufferType.GL_TEXTURE_2D;
    ZegoExpressEngine.getEngine().enableCustomVideoProcessing(false,zegoCustomVideoProcessConfig);
    ZegoExpressEngine.getEngine().setCustomVideoProcessHandler(null);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      init();
      result.success(null);
    }
    else if (call.method.equals("uninit")) {
      uninit();
      result.success(null);

    } else if(call.method.equals("setBeautyOption")) {

      float faceWhiten = ZegoUtils.floatValue((Number) call.argument("faceWhiten"));
      float faceRed = ZegoUtils.floatValue((Number) call.argument("faceRed"));
      float faceBlur = ZegoUtils.floatValue((Number) call.argument("faceBlur"));

      float eyeEnlarging = ZegoUtils.floatValue((Number) call.argument("eyeEnlarging"));

      float cheekThinning = ZegoUtils.floatValue((Number) call.argument("cheekThinning"));
      float cheekV = ZegoUtils.floatValue((Number) call.argument("cheekV"));
      float cheekNarrow = ZegoUtils.floatValue((Number) call.argument("cheekNarrow"));
      float cheekSmall = ZegoUtils.floatValue((Number) call.argument("cheekSmall"));

      float chinLevel = ZegoUtils.floatValue((Number) call.argument("chinLevel"));
      float foreHeadLevel = ZegoUtils.floatValue((Number) call.argument("foreHeadLevel"));
      float noseLevel = ZegoUtils.floatValue((Number) call.argument("noseLevel"));
      float mouthLevel = ZegoUtils.floatValue((Number) call.argument("mouthLevel"));

      if(inited == true) {

        if(faceWhiten >= 0) {
          mFURenderer.onColorLevelSelected(faceWhiten);
        }

        if(faceRed >= 0) {
          mFURenderer.onRedLevelSelected(faceRed);
        }

        if(faceBlur >= 0) {
          mFURenderer.onBlurLevelSelected(faceBlur);
        }

        if(eyeEnlarging >= 0) {
          mFURenderer.onEyeEnlargeSelected(eyeEnlarging);
        }

        if(cheekThinning >= 0) {
          mFURenderer.onCheekThinningSelected(cheekThinning);
        }

        if(cheekV >= 0) {
          mFURenderer.onCheekVSelected(cheekV);
        }

        if(cheekNarrow >= 0) {
          mFURenderer.onCheekNarrowSelected(cheekNarrow);
        }

        if(cheekSmall >= 0) {
          mFURenderer.onCheekSmallSelected(cheekSmall);
        }

        if(chinLevel >= 0) {
          mFURenderer.onIntensityChinSelected(chinLevel);
        }

        if(foreHeadLevel >= 0) {
          mFURenderer.onIntensityForeheadSelected(foreHeadLevel);
        }

        if(noseLevel >= 0) {
          mFURenderer.onIntensityNoseSelected(noseLevel);
        }

        if(mouthLevel >= 0) {
          mFURenderer.onIntensityMouthSelected(mouthLevel);
        }
      }

      result.success(null);


    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    uninit();
  }

  @Override
  public void onTrackingStatusChanged(int status) {

  }
}
