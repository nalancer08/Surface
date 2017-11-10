package com.appbuilders.surfacedemo.Controllers;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.appbuilders.surface.SfControl;
import com.appbuilders.surface.SfSize;
import com.appbuilders.surfacedemo.Controls.TabBar;
import com.appbuilders.surfacedemo.View.MainView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        MainView view = new MainView(this, false);
    }
}