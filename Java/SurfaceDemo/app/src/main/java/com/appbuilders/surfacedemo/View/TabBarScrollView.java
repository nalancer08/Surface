package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.content.Intent;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Tabs.TabBarItem;
import com.appbuilders.surfacedemo.Controls.TabBar;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 07/10/17
 */

public class TabBarScrollView extends SurfaceActivityView implements TabBarControl.TabBarControlListener {

    public TabBarScrollView(Context context) {
        super(context);
    }

    @Override
    public void onCreateView() {

        TabBar tab = new TabBar(this, this, 2);
    }

    @Override
    public void onItemClick(int position, TabBarItem item) {

        this.activity.startActivity(new Intent(this.context, item.getClazz()));
        this.activity.finish();
    }
}
