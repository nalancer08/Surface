package com.appbuilders.surface;

import android.app.Activity;
import android.content.Context;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.AbsoluteLayout;

/**
 * Created by ercsanchez on 26/09/17.
 */

public abstract class SurfaceActivityView {

    protected Activity activity;
    protected Context context;

    protected AbsoluteLayout screenCanvas;

    protected SfPanel screen;

    /**
     * Constructor to require context
     * @param context: Activity context
     **/
    public SurfaceActivityView(Context context) {

        this.activity = ((Activity)context);
        this.context = context;
        this.initialize(false);
    }

    /**
     * Constructor to require context
     * @param context: Activity context
     * @param fullScreen: Boolean to use full screen
     **/
    public SurfaceActivityView(Context context, boolean fullScreen) {

        this.activity = ((Activity)context);
        this.context = context;
        this.initialize(fullScreen);
    }

    /**
     * Method to initialize the main variables, it's called automatically for the constructor
     * @param fullScreen: Boolean to use full screen
     **/
    private void initialize(boolean fullScreen) {

        // Make it full screen
        if (fullScreen)
            this.activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN);

        // Clearing action bar
        ActionBar actionbar = ((AppCompatActivity)context).getSupportActionBar();
        actionbar.hide();

        // Creating layouts
        this.screenCanvas = new AbsoluteLayout(this.context);

        // Adding screenCanvas to the screen
        this.activity.setContentView(this.screenCanvas);

        // Creating and sizing the main panel
        this.screen = new SfPanel();
        this.screen.setSize(-70, -50);
        this.screen.setKey("screen");

        // Create the render
        this.onCreateView();
    }

    /**
     * Method to add view to the screen
     **/
    protected void addView(View view) {
        this.screenCanvas.addView(view);
    }

    /**
     * Abstract method to ......
     * **/
    public abstract void onCreateView();
}