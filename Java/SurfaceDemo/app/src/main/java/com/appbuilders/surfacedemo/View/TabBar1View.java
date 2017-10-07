package com.appbuilders.surfacedemo.View;

import android.content.Context;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surfacedemo.Controls.TabBar;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 06/10/17
 */

public class TabBar1View extends SurfaceActivityView implements TabBarControl.TabBarControlListener {

    public TabBar1View(Context context) {
        super(context);
    }

    @Override
    public void onCreateView() {

        TabBar tab = new TabBar(this, this, 3);
    }

    @Override
    public void onItemClick(int position) {
        this.activity.startActivity(((TabBar)this.tabBar).changeTab(position));
        this.activity.finish();
    }
}
