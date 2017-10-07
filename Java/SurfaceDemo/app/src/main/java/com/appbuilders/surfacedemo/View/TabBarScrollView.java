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
 * Revision 1 - 07/10/17
 */

public class TabBarScrollView extends SurfaceActivityView implements TabBarControl.TabBarControlListener {

    public TabBarScrollView(Context context) {
        super(context);
    }

    @Override
    public void onCreateView() {

        TabBar tab = new TabBar(this, this, 2);
        SfPanel scrollBody = new SfPanel().setSize(-100, -100);
        this.body.append(scrollBody);
        this.makeItScrollable(scrollBody, "scrollBody");

        View sub = new View(this.context);
        sub.setBackgroundColor(Color.BLUE);

        View lala = new View(this.context);
        lala.setBackgroundColor(Color.GRAY);
        this.body.setView(lala);
        this.addView(lala);

        this.screen.setView(sub);
        this.addView(sub);

        for (int i = 0; i < 100; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
            Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
            Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

            vii.setBackgroundColor(Color.rgb(c1, c2, c3));

            scrollBody.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii).setMargin(i*5, 0, 20, 0);
            this.addToScroll("scrollBody", vii);
        }

        this.screen.update(this.context);
    }

    @Override
    public void onItemClick(int position, TabBarItem item) {

        this.activity.startActivity(new Intent(this.context, item.getClazz()));
        this.activity.finish();
    }
}
