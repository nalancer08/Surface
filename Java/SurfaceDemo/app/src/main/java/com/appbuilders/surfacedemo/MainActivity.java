package com.appbuilders.surfacedemo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.appbuilders.surface.SfSize;
import com.appbuilders.surfacedemo.View.MainView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        MainView view = new MainView(this);
    }
}
