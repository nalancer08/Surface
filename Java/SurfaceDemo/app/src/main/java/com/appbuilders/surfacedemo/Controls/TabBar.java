package com.appbuilders.surfacedemo.Controls;

import android.content.Context;
import android.content.Intent;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SfControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surfacedemo.Controllers.TabBar1;
import com.appbuilders.surfacedemo.MainActivity;

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

    /**
     * This method handle change tabs
     **/
    public Intent changeTab(int position) {

        Intent intent = null;

        switch(position) {

            case 0:
                intent = new Intent(view.getContext(), MainActivity.class);
                break;

            case 1:
                intent = new Intent(view.getContext(), TabBar1.class);
                break;

            case 2:
                intent = new Intent(view.getContext(), MainActivity.class);
                break;

            case 3:
                intent = new Intent(view.getContext(), TabBar1.class);
                break;

            case 4:
                intent = new Intent(view.getContext(), MainActivity.class);
                break;
        }

        return intent;
    }
}
