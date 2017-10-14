package com.appbuilders.surfacedemo.Controls;

import android.graphics.Color;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Tabs.TabBarItem;
import com.appbuilders.surfacedemo.Controllers.HybridXmlSurface;
import com.appbuilders.surfacedemo.Controllers.SurfaceWithFragments;
import com.appbuilders.surfacedemo.Controllers.TabBar1;
import com.appbuilders.surfacedemo.Controllers.TabBarScroll;
import com.appbuilders.surfacedemo.Controllers.MainActivity;
import com.appbuilders.surfacedemo.R;

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

        // Create elements
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), MainActivity.class, "\uf015", Color.CYAN, Color.GREEN));
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), TabBar1.class, "\uf016", Color.CYAN, Color.GREEN));
        //this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), "\uf017", TabBarScroll.class, Color.CYAN, Color.GREEN));
        this.tabBarItems.add(TabBarItem.createImageItem(this.getContext(), TabBarScroll.class, R.drawable.house, R.drawable.house));
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), HybridXmlSurface.class, "\uf018", Color.CYAN, Color.GREEN));
        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), SurfaceWithFragments.class, "\uf019", Color.CYAN, Color.GREEN));
    }
}