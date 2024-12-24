package com.shiffumediatek.gitss

import android.hardware.Sensor
import android.hardware.SensorManager
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

    companion object {
        private val TAG = MainActivity::class.java.simpleName
        private const val CHANNEL = "com.shiffumediatek.gitss/main"
        private const val NATIVE_EVENT_SENSORS_AVAILABLE = "sensors_available"
        private const val NATIVE_EVENT_ROOT_CHECKER = "root_checker"
        private const val NATIVE_EVENT_SIM_CARD_SLOTS = "check_sim_slots"
    }
}
