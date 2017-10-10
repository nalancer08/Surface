package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.view.View;
import android.widget.Toast;

import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Controls.TabBarControl;
import com.appbuilders.surface.Tabs.TabBarItem;
import com.appbuilders.surfacedemo.Controls.TabBar;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 05/10/17
 */

public class MainView extends SurfaceActivityView implements TabBarControl.TabBarControlListener {

    public MainView(Context context) {
        super(context);
    }

    @Override
    public void onCreateView() {

        /** Tab bar **/
        this.tabBar = new TabBar(this, this, 0);

        View bk = new View(this.context);
        bk.setBackgroundColor(Color.MAGENTA);
        this.body.setView(bk);
        this.addView(bk);

        for (int i = 0; i < 20; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
            Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
            Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

            vii.setBackgroundColor(Color.rgb(c1, c2, c3));
            final int finalI = i;
            vii.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Toast.makeText(context, "I :: " + finalI, Toast.LENGTH_SHORT).show();
                }
            });

            this.body.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii);//.setMargin(i*5, 0, 20, 0);
            this.addView(vii);
        }

        this.screen.update(this.context);
    }

    @Override
    public void onItemClick(int position, TabBarItem item) {

        this.activity.startActivity(new Intent(this.context, item.getClazz()));
        this.activity.finish();
    }
}