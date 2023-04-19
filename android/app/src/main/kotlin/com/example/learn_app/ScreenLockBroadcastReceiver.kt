// import android.content.BroadcastReceiver
// import android.content.Context
// import android.content.Intent
// import android.util.Log
// import io.flutter.view.FlutterMain


// class ScreenLockBroadcastReceiver : BroadcastReceiver() {
//     // companion object {
//     //     private const val TAG = "GeofencingBroadcastReceiver"
//     // }
//     override fun onReceive(context: Context, intent: Intent) {
//         if (intent.getAction().equals(Intent.ACTION_SCREEN_OFF)) {
//             Log.i("Check","Screen went OFF");
//             //Toast.makeText(context, "screen OFF",Toast.LENGTH_LONG).show();
//         } else if (intent.getAction().equals(Intent.ACTION_SCREEN_ON)) {
//             Log.i("Check","Screen went ON");
//             //Toast.makeText(context, "screen ON",Toast.LENGTH_LONG).show();
//         }

//         // FlutterMain.startInitialization(context)
//         // FlutterMain.ensureInitializationComplete(context, null)
//         // GeofencingService.enqueueWork(context, intent)
//     }
// }