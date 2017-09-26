package com.appbuilders.surface;

import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.os.CountDownTimer;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.Window;
import android.widget.AbsoluteLayout;
import android.widget.ScrollView;

import java.util.Objects;

/**
 * Created by ercsanchez on 26/09/17.
 */

public class SfScreen {

    // Constants
    static public int ScreenWidth = 1;
    static public int ScreenHeight = 2;

    // Context
    public Context context;

    // Base screen sizes with Galaxy S6
    public int screenBaseX = 1440;
    public int screenBaseY = 2560;

    // Variables to save current screen dimensions
    public int screenX;
    public int screenY;

    // Density scale
    public double mainScale =  3.0;
    public double minDensity =  1.0;

    // I didnt remeber
    public static final int inX = 0;
    public static final int inY = 1;

    /****************************************************************************************
     *                                 Second revision (16/04/2017)                         *
     ***************************************************************************************/
    private boolean autoStatbusbarHide = false;
    protected Window statusBar = null;

    /**
     * Constructor to define the context and get screen size
     * @param context: Application context
     * */
    public Screen( Context context ) {

        this.setContext(context);
        this.getScreen();
    }

    public Screen setContentView () {

        ((Activity)this.context).setContentView(this.windowsCanvas);
        return this;
    }

    /**
     * This method delete the status bar (actually don't use it, cause have bad ram stability)
     * */
    public void deleteStatusBar(Window window) {
        window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN);
    }

    /**
     * This method help to add a view
     * */
    public void addView(View view) {
        this.windowsCanvas.addView(view);
    }

    public void removeView(View view) {

        this.windowsCanvas.removeView(view);
    }

    /**
     * This method help to add a sub view
     * */
    public void addSubView(View view) {
        this.subWindowCanvas.addView(view);
    }

    /** Global update */
    public void update(SfPanel panel) {
        panel.update(this.context);
    }

    /**
     * Setter for context
     * */
    public void setContext(Context context) {
        this.context = context;
    }

    /**
     * Getter for context
     * */
    public Context getContext() {
        return this.context;
    }

    /**
     * This method get the screen size
     * */
    public void getScreen() {

        Display display = ((Activity)this.context).getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);
        this.screenX = size.x;
        this.screenY = size.y;

        Log.d("AB_DEV", "PANTALLA = " + this.screenX + ", " + this.screenY);
        //Log.d("AB_DEV", "Desnsity = " + getContext().getResources().getDisplayMetrics().density);

    }

    public int getScreenAxis(int axis) {

        Display display = ((Activity)this.context).getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);

        if (ScreenWidth == axis) {
            return size.x;
        } else if (ScreenHeight == axis) {
            return size.y;
        }
        return 0;
    }

    /**
     * This method transform a dimension in base a screen density
     * */
    public int getDp(int value, int reference) {

        int ret = 0;

        if ( reference == 0 ) { // In X
            ret = ( this.screenX * value ) / this.screenBaseX;
        } else if ( reference == 1 ) { // In Y
            ret = ( this.screenY * value ) / this.screenBaseY;
        }
        return ret;
    }

    /**
     * This method transform a dimension in base a Galaxy S6 screen width density
     * */
    public int getDpX(int value) {
        return ( this.screenX * value ) / this.screenBaseX;
    }

    /**
     * This method transform a dimension in base a Galaxy S6 height screen density
     * */
    public int getDpY(int value) {
        return ( this.screenY * value ) / this.screenBaseY;
    }

    /**
     * This method return dps in base a Galaxy S6 screen density
     * */
    public int getDps(int dps) {

        final float scale = getContext().getResources().getDisplayMetrics().density;
        return (int) (dps * scale + 0.5f);
    }

    /**
     * This method return a transform dp in base a Galaxy S6 screen density
     * */
    public int getDp(int dps) {

        float scale = getContext().getResources().getDisplayMetrics().density;
        return (int) (( scale * dps ) / this.mainScale);
    }

    public void setAutoStatusbarHide(boolean hide) {
        this.autoStatbusbarHide = hide;
    }

    public boolean getAutoStatusbarHide() {
        return this.autoStatbusbarHide;
    }

    public void sutoHideStatusbar() {

        if ( this.statusBar != null ) {

            new CountDownTimer(5000, 1000) {

                public void onTick(long millisUntilFinished) {

                }

                @Override
                public void onFinish() {

                    deleteStatusBar(statusBar);
                    sutoHideStatusbar();
                }
            }.start();
        }
    }

    /** Abstract methods **/
}
