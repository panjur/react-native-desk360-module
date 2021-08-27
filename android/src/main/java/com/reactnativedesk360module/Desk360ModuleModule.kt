package com.reactnativedesk360module

import android.content.Intent
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.teknasyon.desk360.helper.Desk360Client
import com.teknasyon.desk360.helper.Desk360SDKManager
import com.teknasyon.desk360.helper.Environment
import com.teknasyon.desk360.helper.Platform
import org.json.JSONObject

class Desk360ModuleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {


  private val APP_KEY = "zIu9jt0zXQCx2Kvm6S3BGu12GThMh3YM"
  private var desk360Client: Desk360Client? = null
    override fun getName(): String {
        return "Desk360Module"
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {

      promise.resolve(a * b)

    }

  @ReactMethod
  public fun intialize(userName: String,
                userEmail: String,
                targetId: String,
                pushToken: String,
                deviceId: String,
                promise: Promise) {
    val desk360SDKManager = Desk360SDKManager.Builder()
      .appKey(APP_KEY)
      .appVersion(APP_KEY)
      .languageCode("en")
      .environment(Environment.PRODUCTION)
      .platform(Platform.GOOGLE)
      .theme(1)
      .jsonObject(JSONObject())
      .addIntentFlags(
        arrayOf(
          Intent.FLAG_ACTIVITY_CLEAR_TOP,
          Intent.FLAG_ACTIVITY_SINGLE_TOP,
          Intent.FLAG_ACTIVITY_NEW_TASK
        )
      )
      .name(userName)
      .emailAddress(userEmail)
      .build()

    desk360Client = desk360SDKManager.initialize(_targetId = targetId, _token = pushToken, _deviceToken = deviceId)

    promise.resolve("Success")
  }

  @ReactMethod
  public fun show(promise: Promise) {
    if (desk360Client != null) {
      desk360Client!!.start(reactApplicationContext)
      promise.resolve("Success")
    } else {
      promise.reject(Throwable("Error: Client not intialized"))
    }


  }


}
