package com.appbuilders.surfacedemo.Controllers;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.AbsoluteLayout;

import com.appbuilders.surfacedemo.R;
import com.appbuilders.surfacedemo.View.HybridXmlSurfaceView;

public class HybridXmlSurface extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hybrid_xml_surface);
        AbsoluteLayout baseLayout = (AbsoluteLayout) findViewById(R.id.baseLayout);

        HybridXmlSurfaceView view = new HybridXmlSurfaceView(this, baseLayout);

    }
}
