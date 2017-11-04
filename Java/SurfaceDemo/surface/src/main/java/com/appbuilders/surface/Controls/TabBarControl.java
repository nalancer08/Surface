package com.appbuilders.surface.Controls;

import android.graphics.Color;
import android.os.Build;
import android.util.Log;
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
    private float tabBarHeight = 10.0f;
    private boolean selectedHeight = true;

    protected SfPanel tabBar = null;

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
     * Constructor to define the context and get screen size
     * @param view : SurfaceActivityView
     * @param listener: Listener
     * @param position: Integer position
     **/
    public TabBarControl(SurfaceActivityView view, TabBarControlListener listener, int position) {

        super(view);
        this.tabListener = listener;
        this.initialize(position);
        this.create();
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

    public void setSelectedHeight(boolean state) {

        this.selectedHeight = state;
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
            float tabHeight = selectedHeight ? 85 : 100;
            float tabMarginTop = selectedHeight ? 40 : 0;

            if (this.view.body == null) {
                this.view.body = new SfPanel().setSize(-100, -(100-tabBarHeight));
            }

            for (int i = 0; i < tabsNumber; i++) {

                final TabBarItem item = this.tabBarItems.get(i);
                SfPanel tab = new SfPanel();
                View view = item.getView();
                View selected = item.getSelectedView();
                final int position = i;

                if (item.getPanel() == null) { // New panel
                    if (view != null) {

                        tab.setSize(-(100 / tabsNumber), -tabHeight).setMargin(this.getDpY(tabMarginTop), 0, 0, 0);
                        if (this.currentTabPosition == i) {
                            tab.setSize(-(100 / tabsNumber), -100).setMargin(0, 0, 0, 0);
                            if (selected != null) {
                                tab.setView(selected);
                                this.view.addView(selected);
                            }

                        } else {

                            item.setPanel(tab);
                            view.setOnClickListener(new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    if (tabListener != null) {
                                        tabListener.onItemClick(position, item);
                                    }
                                }
                            });
                            tab.setView(view);
                            this.view.addView(view);
                        }
                        this.tabBar.append(tab);
                    }

                } else { // Using current item panel

                    if (this.currentTabPosition == i) {

                        tab = (item.getSelectedPanel() != null) ? item.getSelectedPanel() : item.getPanel();
                        tab.setSize(-(100 / tabsNumber), -100).setMargin(0, 0, 0, 0);
                        this.view.addView(tab.getView());

                    } else {

                        tab = item.getPanel();
                        tab.setSize(-(100 / tabsNumber), -tabHeight).setMargin(this.getDpY(tabMarginTop), 0, 0, 0);
                        tab.getView().setOnClickListener(new View.OnClickListener() {
                            @Override
                            public void onClick(View view) {
                                if (tabListener != null) {
                                    tabListener.onItemClick(position, item);
                                }
                            }
                        });
                        this.view.addView(tab.getView());
                    }
                    this.tabBar.append(tab);
                }
            }

            if (this.view.subScreen == null) {
                this.view.screen.append(this.view.body);
                this.view.screen.append(this.tabBar);
            } else {
                this.view.subScreen.append(this.view.body);
                this.view.subScreen.append(this.tabBar);
            }
            this.view.screen.update(this.getContext());
        }
        return this.view.body;
    }

    /**
     * Abstract method to force to add tabs array
     **/
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