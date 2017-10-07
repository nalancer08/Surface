package com.appbuilders.surfacedemo.Controls;

import android.content.Context;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SfControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 06/10/17
 */

public class TabBar extends TabBarControl {

    /**
     * Constructor to define the context and get screen size
     * @param view : Application context
     **/
    public TabBar(SurfaceActivityView view, TabBarControlListener listener, int position) {

        super(view, listener);
        this.initialize(position);
    }


    public void initialize(int position) {

        this.initialize(5, position);
        this.create();
    }
}
