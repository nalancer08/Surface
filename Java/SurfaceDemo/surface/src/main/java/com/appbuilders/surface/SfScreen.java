package com.appbuilders.surface;

import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.util.Log;
import android.view.Display;

/**
 * Created by ercsanchez on 26/09/17.
 */

public class SfScreen {

    // Constants
    static public int ScreenWidth = 1;
    static public int ScreenHeight = 2;

    // Context
    private Context context;

    // Base screen sizes with Galaxy S6
    private int screenBaseX = 1440;
    private int screenBaseY = 2560;

    // Variables to save current screen dimensions
    private int screenX;
    private int screenY;

    // Density scale
    private double mainScale =  3.0;
    public double minDensity =  1.0;

    // Instance
    private static SfScreen mInstance = null;

    public static SfScreen getInstance(Context context) {

        if ( mInstance == null ) {
            Class clazz = SfScreen.class;
            synchronized (clazz) {
                mInstance = new SfScreen(context);
            }
        }
        return mInstance;
    }

    /**
     * Constructor to define the context and get screen size
     * @param context: Application context
     * */
    public SfScreen( Context context ) {

        this.context = context;
        this.getScreen();
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

    /**
     * This method allow to get a specific measure axis
     * @param axis: Integer with reference axis
     **/
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
     * @param value: Float number
     * */
    public float getDpX(float value) {
        return ( this.screenX * value ) / this.screenBaseX;
    }

    /**
     * This method transform a dimension in base a Galaxy S6 screen width density
     * @param value: Ineteger number
     * */
    public int getDpX(int value) {
        return ( this.screenX * value ) / this.screenBaseX;
    }

    /**
     * This method transform a dimension in base a Galaxy S6 height screen density
     * @param value: Integer number
     * */
    public int getDpY(int value) {
        return ( this.screenY * value ) / this.screenBaseY;
    }

    /**
     * This method transform a dimension in base a Galaxy S6 height screen density
     * @param value: Float number
     * */
    public float getDpY(float value) {
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
}
