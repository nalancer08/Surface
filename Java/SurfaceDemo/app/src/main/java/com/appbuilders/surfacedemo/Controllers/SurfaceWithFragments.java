package com.appbuilders.surfacedemo.Controllers;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.appbuilders.surfacedemo.R;
import com.appbuilders.surfacedemo.View.SurfaceWithFragmentsView;

public class SurfaceWithFragments extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        SurfaceWithFragmentsView view = new SurfaceWithFragmentsView(this);
    }
}
