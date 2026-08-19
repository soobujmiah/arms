package com.example.testapp

import android.os.Bundle
import android.view.Gravity
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Minimal programmatic layout so the sample app renders something
        // useful without needing an extra XML layout file.
        val text = TextView(this).apply {
            text = "Android Dev Environment Ready! ✅"
            textSize = 18f
            gravity = Gravity.CENTER
            setPadding(32, 32, 32, 32)
        }
        setContentView(text)
    }
}
