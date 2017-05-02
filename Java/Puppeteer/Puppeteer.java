package com.appbuilders.quienesestepoke.libraries.Surface.Puppeteer;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.View;
import android.widget.AbsoluteLayout;
import android.widget.Button;

import com.appbuilders.quienesestepoke.libraries.Surface.SfPanel;

import java.util.ArrayList;

public class Puppeteer {

    AbsoluteLayout baseLayout;
    Context context;
    SfPanel panelRoot;
    SfPanel panelHeader;
    SfPanel panelFooter;
    SfPanel panelContent;
    View viewRoot;
    View viewHeader;
    View viewFooter;
    View viewContent;
    ArrayList<View> footerButtons;
    ArrayList<SfPanel> footerPanels;
    SfPanel panelMenuButton;
    Button viewMenuButton;

    public static final int PUPPET_HEADER_ONLY   = 0;
    public static final int PUPPET_FOOTER_ONLY   = 1;
    public static final int PUPPET_HEADER_FOOTER = 2;

    public static final int PUPPET_MENU_LEFT  = 0;
    public static final int PUPPET_MENU_RIGHT = 1;

    public Puppeteer(Context context) {
        this.context= context;
        this.baseLayout = null;
        this.panelRoot = null;
        this.panelHeader = null;
        this.panelFooter = null;
        this.panelContent = null;
        this.viewRoot = null;
        this.viewHeader = null;
        this.viewFooter = null;
        this.viewContent = null;
        this.footerButtons = new ArrayList<View>();
        this.footerPanels = new ArrayList<SfPanel>();
        this.panelMenuButton = null;
        this.viewMenuButton = null;
    }

    public SfPanel addMenuButton(String caption, int image, int width, int placement, View.OnClickListener listener) {
        if (this.panelHeader != null) {
            if (this.panelMenuButton == null) {
                panelMenuButton = new SfPanel();
                viewMenuButton = new Button(this.context);
            }
            // Button stuff
            if (caption != null && caption.compareTo("") != 0) {
                viewMenuButton.setText(caption);
            }
            if (image > 0) {
                viewMenuButton.setBackgroundResource(image);
            }
            if (listener != null) {
                viewMenuButton.setOnClickListener(listener);
            }
            // Panel stuff
            panelMenuButton.setView(viewMenuButton);
            panelMenuButton.setSize(width, this.panelHeader.frame.height);
            this.panelHeader.append(panelMenuButton);
            this.baseLayout.addView(viewMenuButton);
            //
            panelMenuButton.setPosition(SfPanel.SF_POSITION_ABSOLUTE);
            if (placement == PUPPET_MENU_LEFT) {
                panelMenuButton.setOrigin(0, SfPanel.SF_UNSET, SfPanel.SF_UNSET, 0);
            } else {
                panelMenuButton.setOrigin(0, 0, SfPanel.SF_UNSET, SfPanel.SF_UNSET);
            }
            // Update
            this.panelHeader.update(this.context);
        }
        return panelMenuButton;
    }

    public SfPanel addFooterButton(String caption, int image, int width, View.OnClickListener listener) {
        SfPanel panel = null;
        Button button = null;
        if (this.panelFooter != null) {
            panel = new SfPanel();
            button = new Button(this.context);
            // Button stuff
            if (caption != null && caption.compareTo("") != 0) {
                button.setText(caption);
            }
            if (image > 0) {
                button.setBackgroundResource(image);
            }
            if (listener != null) {
                button.setOnClickListener(listener);
            }
            // Panel stuff
            panel.setView(button);
            panel.setSize(width, this.panelFooter.frame.height);
            this.panelFooter.append(panel);
            this.baseLayout.addView(button);
            // Add them to the arrays
            this.footerPanels.add(panel);
            this.footerButtons.add(button);
            // Update
            this.panelFooter.update(this.context);
        }
        return panel;
    }

    public SfPanel getFooterButton() {
        return this.panelFooter;
    }

    public SfPanel removeFooterButton() {
        return this.panelFooter;
    }

    public SfPanel clearFooterButtons() {
        return this.panelFooter;
    }

    public SfPanel createLayout(int layout) {
        TypedValue tv = new TypedValue();
        int headerHeight = 0;
        this.context.getTheme().resolveAttribute(android.R.attr.actionBarSize, tv, true);
        headerHeight = context.getResources().getDimensionPixelSize(tv.resourceId) + 12;
        // Create the base layout
        this.baseLayout = new AbsoluteLayout(this.context);
        // Create root and content panels/views
        this.panelRoot = new SfPanel();
        this.panelContent = new SfPanel();
        this.viewRoot = new View(this.context);
        this.viewContent = new View(this.context);
        // Set panel views
        this.panelRoot.setView(viewRoot);
        this.panelContent.setView(viewContent);
        this.panelRoot.setKey("puppeteer-root");
        this.panelContent.setKey("puppeteer-content");
        // Create header and/or footer panels/views
        switch (layout) {
            case PUPPET_HEADER_ONLY:
                this.panelHeader = new SfPanel();
                this.viewHeader = new View(this.context);
                // Set panel view
                this.panelHeader.setView(viewHeader);
                this.panelHeader.setKey("puppeteer-header");
                break;
            case PUPPET_FOOTER_ONLY:
                this.panelFooter = new SfPanel();
                this.viewFooter = new View(this.context);
                // Set panel view
                this.panelFooter.setView(viewFooter);
                this.panelFooter.setKey("puppeteer-footer");
                break;
            case PUPPET_HEADER_FOOTER:
                this.panelHeader = new SfPanel();
                this.panelFooter = new SfPanel();
                this.viewHeader = new View(this.context);
                this.viewFooter = new View(this.context);
                // Set panel views
                this.panelHeader.setView(viewHeader);
                this.panelFooter.setView(viewFooter);
                this.panelHeader.setKey("puppeteer-header");
                this.panelFooter.setKey("puppeteer-footer");
                break;
        }
        // Add views into base layout and create panel hierarchy
        this.baseLayout.addView(viewRoot);
        if (this.viewHeader != null) {
            this.baseLayout.addView(viewHeader);
            this.panelRoot.append(panelHeader);
        }
        if (this.viewFooter != null) {
            this.baseLayout.addView(viewFooter);
            this.panelRoot.append(panelFooter);
        }
        this.baseLayout.addView(viewContent);
        this.panelRoot.append(panelContent);
        // Size and position panels
        this.panelRoot.setPosition(SfPanel.SF_POSITION_FIXED)
                .setSize(-100, -100)
                .setOrigin(0, SfPanel.SF_UNSET, SfPanel.SF_UNSET, 0);
        switch (layout) {
            case PUPPET_HEADER_ONLY:
                this.panelHeader.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, headerHeight)
                        .setOrigin(0, SfPanel.SF_UNSET, SfPanel.SF_UNSET, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                this.panelContent.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, 0)
                        .setOrigin(headerHeight, SfPanel.SF_UNSET, 0, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                break;
            case PUPPET_FOOTER_ONLY:
                this.panelFooter.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, headerHeight)
                        .setOrigin(SfPanel.SF_UNSET, SfPanel.SF_UNSET, 0, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                this.panelContent.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, 0)
                        .setOrigin(0, SfPanel.SF_UNSET, headerHeight, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                break;
            case PUPPET_HEADER_FOOTER:
                this.panelHeader.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, headerHeight)
                        .setOrigin(0, SfPanel.SF_UNSET, SfPanel.SF_UNSET, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                this.panelFooter.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, headerHeight)
                        .setOrigin(SfPanel.SF_UNSET, SfPanel.SF_UNSET, 0, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                this.panelContent.setPosition(SfPanel.SF_POSITION_FIXED)
                        .setSize(-100, 0)
                        .setOrigin(headerHeight, SfPanel.SF_UNSET, headerHeight, 0)
                        .setPadding(5, 5, 5, 5)
                        .setZIndex(10);
                break;
        }
        //
        Activity activity = (Activity) this.context;
        activity.setContentView(this.baseLayout);
        // For debug purposes only
        this.viewRoot.setBackgroundColor(Color.rgb(220, 220, 220));
        if (this.viewHeader != null) {
            this.viewHeader.setBackgroundColor(Color.rgb(76, 76, 76));
        }
        if (this.viewFooter != null) {
            this.viewFooter.setBackgroundColor(Color.rgb(76, 76, 76));
        }
        this.viewContent.setBackgroundColor(Color.rgb(255, 255, 255));
        //
        this.panelRoot.update(this.context);
        //
        return this.panelContent;
    }
}