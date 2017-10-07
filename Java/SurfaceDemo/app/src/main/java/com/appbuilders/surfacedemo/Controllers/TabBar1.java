package com.appbuilders.surfacedemo.Controllers;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.appbuilders.surfacedemo.R;
import com.appbuilders.surfacedemo.View.TabBar1View;

public class TabBar1 extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        TabBar1View view = new TabBar1View(this);
    }
}
