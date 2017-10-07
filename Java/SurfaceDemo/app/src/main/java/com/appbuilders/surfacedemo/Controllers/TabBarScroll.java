package com.appbuilders.surfacedemo.Controllers;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.appbuilders.surfacedemo.R;
import com.appbuilders.surfacedemo.View.TabBarScrollView;

public class TabBarScroll extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        TabBarScrollView view = new TabBarScrollView(this);
    }
}
