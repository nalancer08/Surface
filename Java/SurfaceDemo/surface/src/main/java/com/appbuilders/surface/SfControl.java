package com.appbuilders.surface;

import android.content.Context;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 06/10/17
 */

public class SfControl extends SfScreen {

    protected SurfaceActivityView view;

    /**
     * Constructor to define the context and get screen size
     * @param view : Application render
     **/
    public SfControl(SurfaceActivityView view) {

        super(view.getContext());
        this.view = view;
    }
}