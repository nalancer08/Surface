package com.appbuilders.surfacedemo.Controls;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SfControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Tabs.TabBarItem;
import com.appbuilders.surfacedemo.Controllers.HybridXmlSurface;
import com.appbuilders.surfacedemo.Controllers.TabBar1;
import com.appbuilders.surfacedemo.Controllers.TabBarScroll;
import com.appbuilders.surfacedemo.MainActivity;

import java.util.ArrayList;

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
        super(view, listener, position);
    }

    @Override
    public void setTabs() {

        this.tabBarItems = new ArrayList<>();

        // Creating first element
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), "\uf015", MainActivity.class, Color.CYAN, Color.GREEN));
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), "\uf016", TabBar1.class, Color.CYAN, Color.GREEN));
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), "\uf017", TabBarScroll.class, Color.CYAN, Color.GREEN));
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), "\uf018", HybridXmlSurface.class, Color.CYAN, Color.GREEN));
    }
}
