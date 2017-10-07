package com.appbuilders.surfacedemo.View;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.View;
import android.widget.AbsoluteLayout;

import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 07/10/17
 */

public class HybridXmlSurfaceView extends SurfaceActivityView {


    public HybridXmlSurfaceView(Context context, AbsoluteLayout baseLayout) {
        super(context, baseLayout);
    }

    @Override
    public void onCreateView() {

        View boxView = new View(this.context);
        boxView.setBackgroundColor(Color.BLACK);

        SfPanel box = new SfPanel().setSize(-50, -30).setMargin(20, 0, 0, 0).setView(boxView);
        this.subScreen.append(box);
        this.addView(boxView);

        View boxScrollView = new View(this.context);
        boxScrollView.setBackgroundColor(Color.MAGENTA);
        SfPanel boxScroll = new SfPanel().setSize(-85, -65).setMargin(20, 0, 0, 0).setView(boxScrollView);
        this.subScreen.append(boxScroll);
        this.makeItScrollable(boxScroll, "boxScroll");
        //this.addView(boxScrollView);

        for (int i = 0; i < 200; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            if (i % 2 == 0) {
                vii.setBackgroundColor(Color.WHITE);
            } else {
                vii.setBackgroundColor(Color.BLACK);
            }

            boxScroll.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii).setMargin(i*5, 0, 20, 0).setKey("i-" + i);
            this.addToScroll("boxScroll", vii);
        }

        this.screen.update(this.context);
    }
}
