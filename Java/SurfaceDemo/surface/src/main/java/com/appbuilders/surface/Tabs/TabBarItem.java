package com.appbuilders.surface.Tabs;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 07/10/17
 */

public class TabBarItem {

    protected View view = null;
    protected View selectedView = null;
    protected Class clazz = null;

    public void setView(View view) {

        this.view = view;
    }

    public View getView() {

        return this.view;
    }

    public void setSelectedView(View view) {

        this.selectedView = view;
    }

    public View getSelectedView() {

        return this.selectedView;
    }

    public void setClazz(Class clazz) {

        this.clazz = clazz;
    }

    public Class getClazz() {

        return this.clazz;
    }

    public static TabBarItem createBasicItem(Context context, String sequence, Class clazz ,int background, int backgroundSelectd) {

        Typeface font =  Typeface.createFromAsset( context.getAssets(), "FontAwesome.ttf");
        TabBarItem item = new TabBarItem();

        Button button = new Button(context);
        button.setBackgroundColor(background);
        button.setTypeface(font);
        button.setText(sequence);
        button.setTextSize((float) (12 * context.getResources().getDisplayMetrics().density));
        button.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);


        Button buttonSelected = new Button(context);
        buttonSelected.setBackgroundColor(backgroundSelectd);
        buttonSelected.setTypeface(font);
        buttonSelected.setText(sequence);
        buttonSelected.setTextSize((float) (12 * context.getResources().getDisplayMetrics().density));
        buttonSelected.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);

        item.setView(button);
        item.setSelectedView(buttonSelected);
        item.setClazz(clazz);

        return item;
    }

    public static TabBarItem createImageItem(BitmapDrawable drawable) {

        return null;
    }

}