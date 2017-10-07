package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.SfPanel;
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

        this.tabBar = new TabBar(this, this, 2);

        View bk = new View(this.context);
        bk.setBackgroundColor(Color.BLACK);
        this.screen.setView(bk);
        this.addView(bk);

        View bodyBk = new View(this.context);
        bodyBk.setBackgroundColor(Color.BLACK);
        this.body.setView(bodyBk);
        this.addView(bodyBk);

        SfPanel scrollBody = new SfPanel().setSize(-100, -100);
        this.body.append(scrollBody);
        this.makeItScrollable(scrollBody, "scrollBody");

        for (int i = 0; i < 200; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
            Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
            Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

            vii.setBackgroundColor(Color.rgb(c1, c2, c3));

            scrollBody.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii).setMargin(i*5, 0, 20, 0).setKey("i-" + i);
            this.addToScroll("scrollBody", vii);
        }

        scrollBody.getLastChild().setMargin(990, 0, 0, 0);

        this.screen.update(this.context);
    }

    @Override
    public void onItemClick(int position, TabBarItem item) {

        this.activity.startActivity(new Intent(this.context, item.getClazz()));
        this.activity.finish();
    }
}
