package com.appbuilders.surface.Controls;

import android.graphics.Color;
import android.view.View;
import android.widget.Button;

import com.appbuilders.surface.SfControl;
import com.appbuilders.surface.SfPanel;
import com.appbuilders.surface.SurfaceActivityView;
import com.appbuilders.surface.Tabs.TabBarItem;

import java.util.ArrayList;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Revision 1 - 06/10/17
 */

public abstract class TabBarControl extends SfControl {

    private TabBarControlListener tabListener;
    private int tabsNumber = 0;
    private float tabBarHeight = 12.0f;

    protected SfPanel tabBar = null;
    protected SfPanel body = null;

    protected int currentTabPosition = -1;
    protected ArrayList<TabBarItem> tabBarItems;

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

    /**
     * Method to initialize control
     **/
    public TabBarControl initialize(int posiiton) {

        this.currentTabPosition = posiiton;
        this.setTabs();
        return this;
    }

    /**
     * Method to set tabBar height
     * Default value it's 12
     * @param height: Float number
     **/
    public void setTabBarHeight(float height) {

        this.tabBarHeight = height;
    }

    /**
     * Method to set current tan position
     * @param position: Integer position
     **/
    protected TabBarControl setCurrentTabPosition(int position) {

        this.currentTabPosition = position;
        return this;
    }

    /**
     * Method to set height of the current tab
     * @param height: Float number
     **/
    public void setCurrentTabHeight(float height) {

        this.currentTabHeight = height;
    }

    /**
     * Method to get tabBar
     * return SfPanel
     **/
    public SfPanel getTabBar() {

        return this.tabBar;
    }

    /**
     * Method to beginning to draw
     **/
    public SfPanel create() {

        if (this.tabBarItems != null) {

            this.tabsNumber = this.tabBarItems.size();
            this.tabBar = new SfPanel().setSize(-100, -tabBarHeight);

            if (this.body == null) {

                this.body = new SfPanel();
                this.body.setSize(-100, -(100-tabBarHeight));
            }

            for (int i = 0; i < tabsNumber; i++) {

                SfPanel tab = new SfPanel();
                final TabBarItem item = this.tabBarItems.get(i);
                View view = item.getView();
                View selected = item.getSelectedView();
                final int position = i;

                if (view != null) {

                    tab.setSize(-(100 / tabsNumber), -90).setOrigin(0, 0, 0, 0).setMargin(this.getDpY(15), 0, 0, 0);

                    if (this.currentTabPosition == i) {

                        tab.setSize(-(100 / tabsNumber), -100);
                        tab.setMargin(0, 0, this.getDpY(70), 0);
                        if (selected != null) {
                            tab.setView(selected);
                            this.view.addView(selected);
                        }

                    } else {

                        tab.setView(view);
                        view.setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View view) {
                                if (tabListener != null) {
                                    tabListener.onItemClick(position, item);
                                }
                            }
                        });
                        this.view.addView(view);
                    }
                    this.tabBar.append(tab);
                }
            }

            this.view.screen.append(this.body);
            this.view.screen.append(this.tabBar);
            this.view.screen.update(this.getContext());
            this.view.body = this.body;
        }
        return this.body;
    }

    public abstract void setTabs();

    /**
     * Interface to handle events at the tabBar
     **/
    public interface TabBarControlListener {

        /**
         * Method to handle current click position
         **/
        public void onItemClick(int position, TabBarItem item);
    }
}