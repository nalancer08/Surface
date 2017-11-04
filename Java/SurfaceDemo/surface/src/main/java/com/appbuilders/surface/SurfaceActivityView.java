package com.appbuilders.surface;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsoluteLayout;
import android.widget.ScrollView;

import com.appbuilders.surface.Controls.TabBarControl;

import java.util.HashMap;

/**
 * Created by ercsanchez on 26/09/17.
 */

public abstract class SurfaceActivityView {

    protected Activity activity;
    protected Context context;

    protected AbsoluteLayout screenCanvas;

    public SfPanel screen;
    public SfPanel subScreen = null;
    public SfPanel body = null;

    /** Space for controls **/
    public TabBarControl tabBar;

    /** Handle multiples scrolls **/
    protected HashMap<String, AbsoluteLayout> scrolls;

    /**
     * Constructor to require context
     * @param context: Activity context
     **/
    public SurfaceActivityView(Context context) {

        this.activity = ((Activity)context);
        this.context = context;
        this.initialize(false, null);
    }

    /**
     * Constructor to require context
     * @param context: Activity context
     * @param baseLayout: AbsoluteLayout
     **/
    public SurfaceActivityView(Context context, AbsoluteLayout baseLayout) {

        this.activity = ((Activity)context);
        this.context = context;
        this.initialize(false, baseLayout);
    }

    /**
     * Constructor to require context
     * @param context: Activity context
     * @param fullScreen: Boolean to use full screen
     **/
    public SurfaceActivityView(Context context, boolean fullScreen) {

        this.activity = ((Activity)context);
        this.context = context;
        this.initialize(fullScreen, null);
    }

    /**
     * Method to get the contex
     **/
    public Context getContext() {

        return this.context;
    }

    /**
     * Method to initialize the main variables, it's called automatically for the constructor
     * @param fullScreen: Boolean to use full screen
     **/
    private void initialize(boolean fullScreen, AbsoluteLayout baseLayout) {

        // Creating or adding base layout
        if (baseLayout == null) { // Create base layout

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
            this.screen.setSize(-100, -100);
            this.screen.setKey("screen");

        } else { // Adding base layout, passing for constructor

            // Matching canvas with base layout
            this.screenCanvas = baseLayout;

            // Creating and sizing the main panel
            this.screen = new SfPanel();
            this.screen.setSize(-100, -100);
            this.screen.setKey("screen");

            // Fixing sizes
            //float width = (this.screenCanvas.getLayoutParams().width == -1) ? -100 : SfScreen.getInstance(this.context).getDpX(this.screenCanvas.getLayoutParams().width);
            float width = (this.screenCanvas.getLayoutParams().width == -1) ? -100 : this.screenCanvas.getLayoutParams().width;
            //float height = (this.screenCanvas.getLayoutParams().height == -1) ? -100 : SfScreen.getInstance(this.context).getDpY(this.screenCanvas.getLayoutParams().height);
            float height = (this.screenCanvas.getLayoutParams().height == -1) ? -100 : this.screenCanvas.getLayoutParams().height;

            // Fixing coordenates
            Rect myViewRect = new Rect();
            this.screenCanvas.getGlobalVisibleRect(myViewRect);
            float x = myViewRect.left;
            float y = myViewRect.top;

            // Creating subScreen
            this.subScreen = new SfPanel();
            this.subScreen.setSize(width, height).setOrigin(y, 0, 0, x);
            this.subScreen.setKey("subScreen");

            this.screen.append(this.subScreen);
        }

        // Creating stack for scrolls
        this.scrolls = new HashMap<>();

        // Create the render
        this.activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                onCreateView();
            }
        });
    }

    /**
     * Method to allow a panel handle scroll
     * When you add a panel, it automatic it's added to panels stack
     * @param panel: SfPanel to allow scroll
     * @param key: String key of panel, to match next adds
     **/
    protected SfPanel makeItScrollable(SfPanel panel, String key) {

        AbsoluteLayout scroll = new AbsoluteLayout(this.context);
        ScrollView scrollView = new ScrollView(this.context);

        panel.scrollHost = true;
        panel.fixScroll = true;
        panel.setKey(key);
        panel.setView(scrollView);
        this.scrolls.put(key, scroll);

        this.addView(scrollView);
        scrollView.addView(scroll);

        return panel;
    }

    /**
     * Method to add a view to an existed scroll
     * @param key: String key for the previous panel scroll host
     * @param view: View to be added
     **/
    protected void addToScroll(String key, View view) {
       this.scrolls.get(key).addView(view);
    }

    /**
     * Method to add a view to the screen
     * @param view: View to be added to base layout
     **/
    public void addView(View view) {
        this.screenCanvas.addView(view);
    }

    /**
     * Method to remove a view from parent panel
     **/
    public void removeView(SfPanel panel) {

        View view = panel.getView();
        if (view != null) {
            ((ViewGroup) view.getParent()).removeView(view);
        }
    }

    /**
     * Method to add a fragment into a panel
     * The method create AbsoluteLayout, and iy's added to the panel, then
     * we beginning to get fragmentSupport and the transaction into the layout
     * @param panel: SfPanel to be prepared to use fragments
     **/
    public void addFragment(SfPanel panel) {

        if (panel.getFragment() != null) {

            AbsoluteLayout layout = new AbsoluteLayout(this.context);
            layout.setId(1234 + (int)(Math.random() * ((9876 - 1234) + 1234)));
            panel.setView(layout);
            this.addView(layout);
            ((AppCompatActivity)this.activity).getSupportFragmentManager().beginTransaction().replace(layout.getId(), panel.getFragment()).addToBackStack("fragment").commit();

        }
    }

    /**
     * Method to set a custom intent, it going to replace inherent intent
     * Don't need to access to this, 'cause, the activity has an implicit intent
     * It could be restore by the activity
     **/
    public void setIntent(Intent intent) {
        this.activity.setIntent(intent);
    }

    /**
     * Method to get the activity intent
     **/
    public Intent getIntent() {
        return this.activity.getIntent();
    }

    /**
     * This method only can be called, it you're using custom baseLayout
     **/
    public void deleteActionBar() {

        if (this.subScreen != null) {

            ActionBar actionbar = ((AppCompatActivity)this.context).getSupportActionBar();
            actionbar.hide();
        }
    }

    /**
     * Abstract method to draw the widgets with logical
     **/
    public abstract void onCreateView();
}