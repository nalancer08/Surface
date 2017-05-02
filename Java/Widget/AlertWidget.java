package com.appbuilders.quienesestepoke.libraries.Surface.Widget;

import android.content.Context;
import android.graphics.Color;
import android.view.View;

import com.appbuilders.quienesestepoke.libraries.Surface.Core.Screen;
import com.appbuilders.quienesestepoke.libraries.Surface.SfPanel;
import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;
import com.nineoldandroids.animation.Animator;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Erick on 10/04/2017.
 */
public abstract class AlertWidget extends Screen {

    public final static int SmallAlertSize = 0;
    public final static int MediumAlertSize = 1;
    public final static int LargeAlertSize = 2;
    public final static int CustomAlertSize = 3;

    private OnEventListener mOnEventListener;

    private Techniques openTechnique;
    private Techniques closeTechnique;

    private boolean isOpen = false;
    private int size = 0;
        private int sizeX = 0;
        private int sizeY = 0;
        private int top = 0;

    public SfPanel window;
        public SfPanel alert;

    public View windowView;
        public View alertView;

    public int alertBackgroundColor = Color.WHITE;
    public int alertBackground = 0;

    private List<View> alertElements;
    private List<SfPanel> iterationsHide = null;


    /** Constructor
     * @param context: The application context
     * @param view: Screen object, to get the windowsCanvas and get the views an panels in screen
     **/
    public AlertWidget(Context context, Screen view) {

        super(context);
        this.windowsCanvas = view.windowsCanvas;
        //this.deleteStatusBar(window);
        this.alertElements = new LinkedList<>();
        this.iterationsHide = new LinkedList<>();
    }

    /**
     * This method build the Alert, setting the open and close Technique
     * @param openTechnique: Technique to open the alert (AndroidViewAnimations object)
     * @param closeTechnique: Technique to close the alert (AndroidViewAnimations object)
     * @param size: Integer with static variable size of the alert
     **/
    public AlertWidget build(Techniques openTechnique, Techniques closeTechnique, int size) {

        this.openTechnique = closeTechnique;  //openTechnique;
        this.closeTechnique = openTechnique;  //closeTechnique;

        switch(size) {

            case SmallAlertSize:
                this.setCustomSize(90, 50, 650);
                break;

            case MediumAlertSize:
                this.setCustomSize(90, 70, 450);
                break;

            case LargeAlertSize:
                this.setCustomSize(90, 90, 150);
                break;

            default:
                break;
        }

        this.size = size;
        this.onCreate();
        return this;
    }

    /**
     * This method set a custom size, for build the alert
     * @param x: Integer with the width of the alert
     * @param y: Integer with the height of the alert
     * @param top: Integer with the margin top, to be in the center -- This method auto scale in dp
     **/
    public AlertWidget setCustomSize(int x, int y, int top) {

        this.sizeX = -x;
        this.sizeY = -y;
        this.top = top;

        if ( this.alert != null ) {

            this.alert.setSize(this.sizeX, this.sizeY).setZIndex(50).setMargin(this.getDpY(top),0,0,0);
            this.window.update(this.context);
        }

        return this;
    }

    /**
     * This method set the listener for catch open and close of the alert
     * @param listener: onEventListener instance
     **/
    public AlertWidget setOnEventListener(OnEventListener listener) {

        this.mOnEventListener = listener;
        return this;
    }

    /**
     * This method make the bounds of the alert, only paint the base view
     **/
    public AlertWidget onCreate() {

        //this.windowView = new View(this.context);
        //this.windowView.setBackgroundResource(R.color.whiteTrans);

        this.alertView = new View(this.context);

        //this.alertView.setBackgroundResource(R.color.guillotine_background);
        if ( this.alertBackground != 0 ) {
            this.alertView.setBackgroundResource(this.alertBackground);
        } else {
            this.alertView.setBackgroundColor(this.alertBackgroundColor);
        }

        this.alertView.bringToFront();

        /** Panels **/
        this.window = new SfPanel();
            this.alert = new SfPanel();

        /** Matching views **/
        this.alert.setView(alertView);

        /** Appends **/
        this.window.append(this.alert);

        /** Setting sizes **/
        this.window.setSize(-100, -100);//.setPadding(0,0,0,0).setOrigin(0,0,0,0).setPosition(SfPanel.SF_ALIGNMENT_RIGHT);
            this.alert.setSize(this.sizeX, this.sizeY).setMargin(this.getDpY(top),0,0,0);

        /** __adding to screen __Remember if you want animations, dont call this method, make the adds in Controller__ **/
        //this.onAddings();

        /** Update **/
        this.window.update(this.context);

        /** Return */
        return this;
    }

    /**
     * This method open the alert and if it's the listener available, return the state
     **/
    public AlertWidget open() {

        if ( this.alertView != null && this.isOpen == false ) {

            windowsCanvas.addView(alertView);
            alertView.bringToFront();
            alertView.clearFocus();
            this.startAnimation();

            if ( mOnEventListener != null ) {
                mOnEventListener.onOpen();
            }
        }

        return this;
    }

    /**
     * This method close the alert and if it's the listener available, return the state
     **/
    public AlertWidget close() {

        if ( this.alertView != null && this.isOpen == true ) {

            //windowsCanvas.removeView(this.dialogView);
            this.startAnimation();

            if ( mOnEventListener != null ) {
                mOnEventListener.onClose();
            }
        }

        return this;
    }

    private void startAnimation() {

        YoYo.with( this.isOpen == true ? openTechnique : closeTechnique ).duration(500).withListener(new Animator.AnimatorListener() {

            @Override
            public void onAnimationStart(Animator animation) {
                ///open = (open == true) ? false : true;

                    if ( isOpen == true ) { // Menu it's open
                        disappearAlertElements();

                    } else { // Menu it's close
                        disableBehindClicks();
                    }
            }

            @Override
            public void onAnimationEnd(Animator animation) {

                    if ( isOpen == true ) { // Close menu

                        windowsCanvas.removeView(alertView);
                        enableBehindClicks();
                        isOpen = false;

                    } else { // Open Menu

                        onDrawMenu();
                        alert.update(context);
                        isOpen = true;

                        if ( mOnEventListener != null ) {
                            mOnEventListener.onDrawnViews();
                        }
                    }

            }

            @Override
            public void onAnimationCancel(Animator animation) {

            }

            @Override
            public void onAnimationRepeat(Animator animation) {

            }
        }).playOn(alertView);

    }

    public boolean isOpen() {
        return this.isOpen;
    }

    public AlertWidget setIterationHide(SfPanel... panels) {

        for ( SfPanel panel : panels ) {
            this.iterationsHide.add(panel);
        }
        return this;
    }

    protected void disableBehindClicks() {

        for ( SfPanel iterationHide : this.iterationsHide ) {

            ArrayList<SfPanel> originals = iterationHide.getChildren();
            int childCount = originals.size();

            for ( int i = 0; i < childCount; i++ ) {

                View view = originals.get(i).getView();
                if ( view != null ) {

                    view.invalidate();
                    view.setClickable(false);
                    view.setEnabled(false);
                }
            }
        }


    }

    protected void enableBehindClicks() {

        for ( SfPanel iterationHide : this.iterationsHide ) {

            ArrayList<SfPanel> originals = iterationHide.getChildren();
            int childCount = originals.size();

            for ( int i = 0; i < childCount; i++ ) {

                View view = originals.get(i).getView();
                if ( view != null ) {

                    view.bringToFront();
                    view.setClickable(true);
                    view.setEnabled(true);
                }
            }
        }

    }

    public void addAlertElement(View view) {

        this.alertElements.add(view);
        this.windowsCanvas.addView(view);
    }

    public void disappearAlertElements() {

        for (int i = 0; i < this.alertElements.size(); i++ ) {

            View view = this.alertElements.get(i);
            view.invalidate();
            view.setClickable(false);
            view.setEnabled(false);
            this.windowsCanvas.removeView(view);
        }
    }

    /**
     * Abstract method for create draw elements
     **/
    public abstract void onDrawMenu();

    public interface OnEventListener {

        void onOpen();
        void onClose();
        void onDrawnViews();
    }
}
