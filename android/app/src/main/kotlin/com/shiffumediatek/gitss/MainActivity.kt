package com.shiffumediatek.gitss

import android.content.Context
import android.content.pm.PackageManager
import android.hardware.Sensor
import android.hardware.SensorManager
import android.os.Build
import android.telephony.TelephonyManager
import com.scottyab.rootbeer.RootBeer
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                NATIVE_EVENT_SENSORS_AVAILABLE -> sensorChecker(result)
                NATIVE_EVENT_ROOT_CHECKER -> result.success(RootBeer(applicationContext).isRooted)
                NATIVE_EVENT_SIM_CARD_SLOTS -> {
                    if (!hasPhonePermission()) {
                        result.error("PERMISSION_DENIED", "Phone permission is not granted", null)
                        return@setMethodCallHandler
                    }
                    val telephonyManager =
                        getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
                    @Suppress("DEPRECATION")
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                        val simCount = telephonyManager.activeModemCount
                        result.success(simCount)
                    } else {
                        val simCount = telephonyManager.phoneCount
                        result.success(simCount)
                    }
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun sensorChecker(result: MethodChannel.Result) {
        val sensorManager = getSystemService(SENSOR_SERVICE) as SensorManager

        val sensorList = listOf(
            Sensor.TYPE_ACCELEROMETER to "Accelerometer",
            Sensor.TYPE_GYROSCOPE to "Gyroscope",
            Sensor.TYPE_MAGNETIC_FIELD to "Magnetometer",
            Sensor.TYPE_PRESSURE to "Barometer",
            Sensor.TYPE_LIGHT to "Ambient Light",
            Sensor.TYPE_PROXIMITY to "Proximity",
            Sensor.TYPE_RELATIVE_HUMIDITY to "Humidity",
            Sensor.TYPE_AMBIENT_TEMPERATURE to "Temperature",
        )

        val data = mutableMapOf<String, Map<String, Boolean>>()
        sensorList.forEach { (type, name) ->
            val sensor = sensorManager.getDefaultSensor(type)
            if (sensor != null) {
                data[name] = mapOf("available" to true)
            } else {
                data[name] = mapOf("available" to false)
            }
        }

        result.success(data)
    }

    private fun hasPhonePermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // API 30+ : Check for READ_PHONE_NUMBERS
            checkSelfPermission(android.Manifest.permission.READ_PHONE_NUMBERS) == PackageManager.PERMISSION_GRANTED
        } else {
            // API <30: Check for READ_PHONE_STATE
            checkSelfPermission(android.Manifest.permission.READ_PHONE_STATE) == PackageManager.PERMISSION_GRANTED
        }
    }

    companion object {
        private val TAG = MainActivity::class.java.simpleName
        private const val CHANNEL = "com.shiffumediatek.gitss/main"
        private const val NATIVE_EVENT_SENSORS_AVAILABLE = "sensors_available"
        private const val NATIVE_EVENT_ROOT_CHECKER = "root_checker"
        private const val NATIVE_EVENT_SIM_CARD_SLOTS = "check_sim_slots"
    }
}
