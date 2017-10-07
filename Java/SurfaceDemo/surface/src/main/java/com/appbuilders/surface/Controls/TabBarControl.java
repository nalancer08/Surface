package com.appbuilders.surface.Controls;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.Button;

import com.appbuilders.surface.SfControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 06/10/17
 */

public class TabBarControl extends SfControl {

    private TabBarControlListener tabListener;
    private int tabsNumber = 0;
    private float tabBarHeight = 10.0f;

    protected SfPanel tabBar = null;
    protected SfPanel body = null;

    protected int currentTabPosition = -1;

    /** Variables for current tab **/
    protected float currentTabHeight = this.tabBarHeight;

    /**
     * Constructor to define the context and get screen size
     * @param view : SurfaceActivityView
     * @param listener: Listener
     **/
    public TabBarControl(SurfaceActivityView view, TabBarControlListener listener) {

        super(view);
        this.tabListener = listener;
    }

    public TabBarControl initialize(int tabs, int posiiton) {

        this.tabsNumber = tabs;
        this.currentTabPosition = posiiton;
        return this;
    }

    public void setTabBarHeight(float height) {

        this.tabBarHeight = height;
    }

    protected TabBarControl setCurrentTabPosition(int position) {

        this.currentTabPosition = position;
        return this;
    }

    public void setCurrentTabHeight(float height) {

        this.currentTabHeight = height;
    }

    public SfPanel getTabBar() {

        return this.tabBar;
    }

    public SfPanel create() {

        if (this.tabsNumber > 0) {

            this.tabBar = new SfPanel().setSize(-100, -tabBarHeight);

            if (this.body == null) {

                this.body = new SfPanel();
                this.body.setSize(-100, -(100-tabBarHeight));
            }

            for (int i = 0; i < tabsNumber; i++) {

                SfPanel tab = new SfPanel();
                Button tabButton = new Button(this.getContext());
                tabButton.setText("Button " + i);
                tabButton.setBackgroundColor(Color.CYAN);
                final int position = i;
                tabButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        if (tabListener != null) {
                            tabListener.onItemClick(position);
                        }
                    }
                });

                tab.setSize(-(100 / tabsNumber), -90).setOrigin(0, 0, 0, 0).setMargin(this.getDpY(15), 0, 0, 0);
                if (this.currentTabPosition == i) {

                    tab.setSize(-(100 / tabsNumber), -100);
                    tab.setMargin(0, 0, this.getDpY(70), 0);
                    tabButton.setBackgroundColor(Color.RED);
                }

                tab.setView(tabButton);
                this.tabBar.append(tab);
                this.view.addView(tabButton);
            }

            this.view.screen.append(this.body);
            this.view.screen.append(this.tabBar);
            this.view.screen.update(this.getContext());
            this.view.body = this.body;
        }
        return this.body;
    }

    public interface TabBarControlListener {

        public void onItemClick(int position);
    }
}