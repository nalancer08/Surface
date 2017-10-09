package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.support.v4.app.Fragment;
import android.view.View;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Tabs.TabBarItem;
import com.appbuilders.surfacedemo.Controls.TabBar;
import com.appbuilders.surfacedemo.Fragments.SurfaceBasic;
import com.appbuilders.surfacedemo.R;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 09/10/17
 */

public class SurfaceWithFragmentsView extends SurfaceActivityView implements TabBarControl.TabBarControlListener {

    public SurfaceWithFragmentsView(Context context) {
        super(context);
    }

    @Override
    public void onCreateView() {

        this.tabBar = new TabBar(this, this, 4);

        View bk =  new View(this.context);
        bk.setBackgroundResource(R.color.colorPrimary);
        this.body.setView(bk);
        this.addView(bk);


        SfPanel t = new SfPanel().setSize(-80, -70).setFragment(new SurfaceBasic()).setMargin(25, 0, 0, 0);
        this.body.append(t);
        this.addFragment(t);

        this.screen.update(this.context);
    }

    @Override
    public void onItemClick(int position, TabBarItem item) {

        this.activity.startActivity(new Intent(this.context, item.getClazz()));
        this.activity.finish();
    }
}
