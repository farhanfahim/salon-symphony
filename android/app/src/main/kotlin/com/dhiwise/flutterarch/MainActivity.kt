package com.app.salonsymphony


import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import name.avioli.unilinks.UniLinksPlugin
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback;



class MainActivity: FlutterActivity(), PluginRegistrantCallback {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun registerWith(registry: PluginRegistry) {
        UniLinksPlugin.registerWith(registry.registrarFor("com.example.yourappname.uni_links_example.uni_links.UniLinksPlugin"))
    }
}
