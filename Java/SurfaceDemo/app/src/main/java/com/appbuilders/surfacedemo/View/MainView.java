package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.graphics.Color;
import android.view.View;

import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;

import java.util.concurrent.ThreadLocalRandom;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 05/10/17
 */

public class MainView extends SurfaceActivityView {

    public MainView(Context context) {
        super(context);
    }

    @Override
    public void onCreateView() {

        View sub = new View(this.context);
        sub.setBackgroundColor(Color.BLACK);

        this.screen.setView(sub);
        this.addView(sub);

        for (int i = 0; i <100; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
            Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
            Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

            vii.setBackgroundColor(Color.rgb(c1, c2, c3));

            this.screen.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii).setMargin(i*5,0,0,0);
            this.addView(vii);
        }

        this.screen.update(this.context);

    }
}