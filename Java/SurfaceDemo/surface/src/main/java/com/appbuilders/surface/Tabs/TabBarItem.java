package com.appbuilders.surface.Tabs;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

import com.appbuilders.surface.SfPanel;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 07/10/17
 */

public class TabBarItem {

    protected View view = null;
    protected View selectedView = null;
    protected SfPanel panel = null;
    protected SfPanel selectedPanel = null;
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

    public void setPanel(SfPanel panel) {

        this.panel = panel;
    }

    public SfPanel getPanel() {

        return this.panel;
    }

    public void setSelectedPanel(SfPanel panel) {

        this.selectedPanel = panel;
    }

    public SfPanel getSelectedPanel() {

        return this.selectedPanel;
    }

    public void setClazz(Class clazz) {

        this.clazz = clazz;
    }

    public Class getClazz() {

        return this.clazz;
    }

    public static TabBarItem creteCustomItem(Context context, Class clazz, SfPanel panel, SfPanel selectedPanel) {

        TabBarItem item = new TabBarItem();

        item.setClazz(clazz);
        item.setPanel(panel);
        item.setSelectedPanel(selectedPanel);

        return item;
    }

    public static TabBarItem createBasicItem(Context context, String sequence, Class clazz ,int background, int selectedBackground) {

        Typeface font =  Typeface.createFromAsset( context.getAssets(), "FontAwesome.ttf");
        TabBarItem item = new TabBarItem();

        Button button = new Button(context);
        button.setBackgroundColor(background);
        button.setTypeface(font);
        button.setText(sequence);
        button.setTextSize((float) (12 * context.getResources().getDisplayMetrics().density));
        //button.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        //button.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);

        Button buttonSelected = new Button(context);
        buttonSelected.setBackgroundColor(selectedBackground);
        //buttonSelected.setBackgroundResource(R.drawable.tags_rounded_corners);
        //GradientDrawable drawable = (GradientDrawable) buttonSelected.getBackground();
        //drawable.setColor(backgroundSelectd);
        buttonSelected.setTypeface(font);
        buttonSelected.setText(sequence);
        buttonSelected.setTextSize((float) (12 * context.getResources().getDisplayMetrics().density));
        //buttonSelected.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);

        item.setView(button);
        item.setSelectedView(buttonSelected);
        item.setClazz(clazz);

        return item;
    }

    public static TabBarItem createImageItem(Context context, Class clazz, int imageId, int imageSelectedId) {

        TabBarItem item = new TabBarItem();

        ImageView image = new ImageView(context);
        Bitmap bitmap = BitmapFactory.decodeStream(context.getResources().openRawResource(imageId));
        image.setImageBitmap(bitmap);

        ImageView imageSelected = new ImageView(context);
        Bitmap bitmapSelected = BitmapFactory.decodeStream(context.getResources().openRawResource(imageSelectedId));
        imageSelected.setImageBitmap(bitmapSelected);

        item.setView(image);
        item.setSelectedView(imageSelected);
        item.setClazz(clazz);

        return item;
    }

}