package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.view.View;
import android.widget.Toast;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Tabs.TabBarItem;
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

        this.tabBar = new TabBar(this, this, 1);

        this.screen.update(this.context);
    }

    @Override
    public void onItemClick(int position, TabBarItem item) {

        this.activity.startActivity(new Intent(this.context, item.getClazz()));
        this.activity.finish();
    }
}
