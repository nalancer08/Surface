package com.appbuilders.quienesestepoke.libraries.Surface.Widget;

import android.content.Context;
import android.view.View;

import com.appbuilders.quienesestepoke.libraries.Surface.Core.Screen;
import com.appbuilders.quienesestepoke.libraries.Surface.SfPanel;
import com.daimajia.androidanimations.library.Techniques;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Erick on 01/05/2017.
 */
public abstract class Widget extends Screen {

    private boolean isOpen = false;

    private Techniques openTechnique;
    private Techniques closeTechnique;

    private OnEventListener mOnEventListener;

    private List<View> widgetElements;
    private List<SfPanel> iterationsHide = null;

    /**
     * Constructor to define the context and get screen size
     *
     * @param context : Application context
     */
    public Widget(Context context) {
        super(context);
    }

    public boolean isOpen() {
        return this.isOpen;
    }

    public Widget setIterationHide(SfPanel... panels) {

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

    public void disappearDialogElements() {

        for (int i = 0; i < this.widgetElements.size(); i++ ) {

            View view = this.widgetElements.get(i);
            view.invalidate();
            view.setClickable(false);
            view.setEnabled(false);
            this.windowsCanvas.removeView(view);
        }
    }

    public void add(View view) {

        this.widgetElements.add(view);
    }

    public abstract void onCreate();
    public abstract void open();
    public abstract void close();

    public interface OnEventListener {

        void onOpen();
        void onClose();
        void onDrawnViews();
    }
}
