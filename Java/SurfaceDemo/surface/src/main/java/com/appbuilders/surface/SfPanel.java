package com.appbuilders.surface;

import android.content.Context;
import android.content.res.Resources;
import android.support.v4.app.Fragment;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.AppCompatActivity;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.WindowManager;
import android.widget.AbsoluteLayout;

import java.util.ArrayList;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Version 3.1.1 - 09/10/17
 * Revision 1 - 26/09/17
 * Revision 2 - 06/10/17
 * Revision 3 - 09/10/17
 *      Revision 3.1 - 31/10/17
 *      Revision 3.2 - 03/11/17
 * Revision 4 - 05/11/17
 */

public class SfPanel extends Object {

    private SfScreen screen;
    private SfSize size;
    private SfRect frame;
    private SfBox origin;
    private SfBox margin;
    private SfBox marginPercent;
    private SfBox padding;
    private SfBox paddingPercent;
    private int zIndex;
    private int position;
    private int alignment;
    private boolean visible;
    private SfPanel parent;
    private SfPanel firstChild;
    private SfPanel lastChild;
    private SfPanel prev;
    private SfPanel next;
    private View view;
    private String key;
    private float scrollHeight;
    protected boolean scrollHost;
    protected boolean fixScroll;
    private int line;
    protected Fragment fragment;

    public static final int SF_POSITION_RELATIVE = 0;
    public static final int SF_POSITION_ABSOLUTE = 1; // Revision 4
    public static final int SF_POSITION_FIXED    = 2;

    public static final int SF_ALIGNMENT_LEFT    = 0;
    public static final int SF_ALIGNMENT_RIGHT   = 1;
    public static final int SF_ALIGNMENT_CENTER  = 2;

    public static final float SF_UNSET  = -9999;

    /**
     * Constructor method
     **/
    public SfPanel() {

        this.size = new SfSize();
        this.frame = new SfRect();
        this.origin = new SfBox();
        this.margin = new SfBox();
        this.marginPercent = new SfBox();
        this.padding = new SfBox();
        this.paddingPercent = new SfBox();
        this.position = SfPanel.SF_POSITION_RELATIVE;
        this.alignment = SfPanel.SF_ALIGNMENT_CENTER;
        this.visible = true;
        this.zIndex = 0;
        this.parent = null;
        this.firstChild = null;
        this.lastChild = null;
        this.prev = null;
        this.next = null;
        this.view = null;
        this.key = "";
        this.line = 0;
        this.scrollHeight = 0;
        this.scrollHost = false;
        this.fixScroll = false;
        this.fragment = null;
    }

    /**
     * Method to set panel size in pixels
     * Automatically calculate the proportions
     * @param width: Float widht in pixels
     * @param height: Float height in pixels
     **/
    public SfPanel setSize(float width, float height) {

        this.size.setSize(width, height);
        return this;
    }

    /**
     * Method to get size of the panel
     * @return SfSize
     **/
    public SfSize getSize() {

        return this.size;
    }

    /**
     * Method to set panel position
     * Available relative and fixed
     * @param position: Integer reference
     **/
    public SfPanel setPosition(int position) {

        this.position = position;
        return this;
    }

    /**
     * Method to set panel alignment
     * Available left, center and right
     * @param alignment: Integer reference
     **/
    public SfPanel setAlignment(int alignment) {

        this.alignment = alignment;
        return this;
    }

    /**
     * Method to set origin of the panel
     * Deprecated
     **/
    @Deprecated
    public SfPanel setOrigin(float top, float right, float bottom, float left) {
        this.origin.setBox(top, right, bottom, left);
        return this;
    }

    /**
     * Method to get origin box
     * @return SfBox
     **/
    public SfBox getOrigin() {

        return this.origin;
    }

    /**
     * Method to set panel margins in pixels
     * Automatically calculate the size proportions
     * @param top: Float pixels
     * @param right: Float pixels
     * @param bottom: Float pixels
     * @param left: Float pixels
     **/
    public SfPanel setMargin(float top, float right, float bottom, float left) {

        this.margin.setBox(top, right, bottom, left);
        return this;
    }

    /**
     * This method get margin box
     * @return SfBox
     **/
    public SfBox getMargin() {

        return this.margin;
    }

    /**
     * Method to set panel margins in percent
     * In base to the parent
     * @param top: Float percent
     * @param right: Float percent
     * @param bottom: Float percent
     * @param left: Float percent
     **/
    public SfPanel setMarginPercent(float top, float right, float bottom, float left) {

        this.marginPercent.setBox(top, right, bottom, left);
        return this;
    }

    /**
     * Method to set panel padding in pixels
     * Automatically calculate the size proportions
     * @param top: Float pixels
     * @param right: Float pixels
     * @param bottom: Float pixels
     * @param left: Float pixels
     **/
    public SfPanel setPadding(float top, float right, float bottom, float left) {

        this.padding.setBox(top, right, bottom, left);
        return this;
    }

    /**
     * Method to get padding box
     * @return SfBox
     **/
    public SfBox getPadding() {

        return this.padding;
    }

    /**
     * Method to set panel padding in percent
     * In base to the parent
     * @param top: Float percent
     * @param right: Float percent
     * @param bottom: Float percent
     * @param left: Float percent
     **/
    public SfPanel setPaddingPercent(float top, float right, float bottom, float left) {

        this.paddingPercent.setBox(top, right, bottom, left);
        return this;
    }

    /**
     * Method to set parent panel
     * @param parent: SfPanel
     **/
    private SfPanel setParent(SfPanel parent) {

        this.parent = parent;
        return this;
    }

    /**
     * Method to get the parent panel
     * return parent SfPanel
     **/
    public SfPanel getParent() {
        return this.parent;
    }

    /**
     * Method set view with panel
     * @param view: View to be set
     **/
    public SfPanel setView(View view) {

        this.view = view;
        return this;
    }

    /**
     * Method to get the panel's view
     * return View
     **/
    public View getView() {
        return this.view;
    }

    /**
     * Method to remove the view
     **/
    public void removeView() {
        this.view = null;
    }

    /**
     * Method set view with panel
     * @param fragment: Fragmnet to be set
     **/
    public SfPanel setFragment(Fragment fragment) {

        this.fragment = fragment;
        return this;
    }

    /**
     * Method to get the panel's fragment
     * return Fragment
     **/
    public Fragment getFragment() {

        return this.fragment;
    }

    /**
     * Method to set panel string key
     * @param key: String key
     **/
    public SfPanel setKey(String key) {

        this.key = key;
        return this;
    }

    /**
     * Method to get panel's string key
     * return String key
     **/
    public String getKey() {
        return this.key;
    }

    /**
     * Method to append panels
     * This method allow, to set children to a parent panel
     * @param object: SfPanel to be appended
     **/
    public SfPanel append(SfPanel object) {

        if (object != null) {
            object.setParent(this);
            // Our list logic
            if (this.lastChild == null) {
                this.firstChild = object;
                this.lastChild = object;
            } else {
                object.prev = this.lastChild;
                this.lastChild.next = object;
                this.lastChild = object;
            }
        }
        return this;
    }

    /**
     * Method to prepend panels
     * This method add a panel in the beginning of the stack
     * @param object: SfPanel to be prepend
     **/
    public SfPanel prepend(SfPanel object) {

        if (object != null) {
            object.setParent(this);
            // Our list logic
            if (this.firstChild == null) {
                this.firstChild = object;
                this.lastChild = object;
            } else {
                object.next = this.firstChild;
                this.firstChild.prev = object;
                this.firstChild = object;
            }
        }
        return this;
    }

    /**
     * Method to find a panel throw a string key
     * @param key: String key
     **/
    public SfPanel find(String key) {

        SfPanel child = this.firstChild;
        SfPanel ret = null;
        while (child != null) {
            if (child.getKey().compareTo(key) == 0) {
                ret = child;
                break;
            } else {
                ret = child.find(key);
                if (ret != null) break;
            }
            child = child.next;
        }
        return ret;
    }

    /**
     * Method to get the next panel in the stack
     * return SfPanel
     **/
    private SfPanel next() {
        return this.next;
    }

    /**
     * Method to get the previous panel in the stack
     * return SfPanel
     **/
    private SfPanel prev() {
        return this.prev;
    }

    /**
     * Method to get siblings panels into the same parent panel
     * return ArrayList of siblings panels
     **/
    public ArrayList<SfPanel> siblings() {

        ArrayList<SfPanel> siblings = new ArrayList<>();
        if (this.parent != null) {
            SfPanel sibling = this.parent.firstChild;
            while (sibling != null) {
                if (sibling == this) continue;
                siblings.add(sibling);
                sibling = sibling.next;
            }
        }
        return siblings;
    }

    /**
     * Method to get closest parent panel
     * @param key: String parent key
     * return SfPanel
     **/
    public SfPanel closest(String key) {

        SfPanel ret = null;
        if (this.parent != null) {
            if (this.parent.getKey().compareTo(key) == 0) {
                ret = this.parent;
            } else {
                ret = this.parent.closest(key);
            }
        }
        return ret;
    }

    /**
     * Method to remove the current panel of the stack
     **/
    public SfPanel remove() {

        SfPanel prev = this.prev;
        SfPanel next = this.next;
        prev.next = next;
        next.prev = prev;
        return this;
    }

    /**
     * Method to get parent's children
     * return ArrayList
     **/
    public ArrayList<SfPanel> getChildren() {

        ArrayList<SfPanel> children = new ArrayList<SfPanel>();
        SfPanel child = this.firstChild;
        while (child != null) {
            children.add(child);
            child = child.next;
        }
        return children;
    }

    /**
     * Method to get the last child
     **/
    public SfPanel getLastChild() {

        ArrayList<SfPanel> children = this.getChildren();
        return children.get((children.size() - 1));
    }

    /**
     * Method to set z-index
     * Deprecated
     * @param zIndex: Integer layout
     **/
    @Deprecated
    public SfPanel setZIndex(int zIndex) {

        this.zIndex = zIndex;
        return this;
    }

    /**
     * Method to set logical visibility to the panel
     * @param visible: boolean visibility
     **/
    public SfPanel setVisible(boolean visible) {

        this.visible = visible;
        return this;
    }

    /**
     * Method to calculate the size of a panel
     * @param context: Application context
     **/
    public SfPanel calcSize(Context context) {

        float parentWidht = 0;
        float parentHeight = 0;

        if (this.visible) {

            DisplayMetrics metrics = Resources.getSystem().getDisplayMetrics();

            if (this.parent != null) { // Has a parent

                parentWidht = this.parent.frame.width;
                parentHeight = this.parent.frame.height;

            } else { // Using screen size

                boolean fullScreenn = (((AppCompatActivity)context).getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_FULLSCREEN) != 0;
                int offsett = 0;

                if (!fullScreenn) {
                    int resourceId = Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android");
                    offsett += resourceId > 0 ? Resources.getSystem().getDimensionPixelSize(resourceId) : 0;
                }

                parentWidht = metrics.widthPixels;
                parentHeight = metrics.heightPixels - offsett;
            }

            this.frame.width = this.size.width >= 0 ? this.size.width : (parentWidht * -this.size.width ) / 100;
            this.frame.height = this.size.height >= 0 ? this.size.height : (parentHeight * -this.size.height ) / 100;

            switch (this.position) {
                case SF_POSITION_RELATIVE:
                    // Do nothing YAY!
                    break;

                case SF_POSITION_ABSOLUTE: // Revision 4
                    if (this.origin.left != SF_UNSET && this.origin.right != SF_UNSET) {
                        this.frame.width = parentWidht - (this.origin.left + this.origin.right);
                    }
                    if (this.origin.top != SF_UNSET && this.origin.bottom != SF_UNSET) {
                        this.frame.height = parentHeight - (this.origin.top + this.origin.bottom);
                    }
                    break;

                case SF_POSITION_FIXED:
                    if (this.origin.left != SF_UNSET && this.origin.right != SF_UNSET) {
                        this.frame.width = metrics.widthPixels - (this.origin.left + this.origin.right);
                    }
                    if (this.origin.top != SF_UNSET && this.origin.bottom != SF_UNSET) {
                        ActionBar actionbar = ((AppCompatActivity)context).getSupportActionBar();
                        boolean fullScreen = (((AppCompatActivity)context).getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_FULLSCREEN) != 0;
                        boolean actionbarVisible = actionbar != null ? actionbar.isShowing() : false;
                        int offset = 0;
                        if (!fullScreen) {
                            Log.d("DXGO", "Entre al fullscreen");
                            int resourceId = Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android");
                            offset += resourceId > 0 ? Resources.getSystem().getDimensionPixelSize(resourceId) : 0;
                        }
                        if (actionbarVisible) {
                            Log.d("DXGO", "Entre al action");
                            TypedValue tv = new TypedValue();
                            context.getTheme().resolveAttribute(android.R.attr.actionBarSize, tv, true);
                            offset += context.getResources().getDimensionPixelSize(tv.resourceId) + 12;
                        }
                        this.frame.height = metrics.heightPixels - (offset + this.origin.top + this.origin.bottom);
                    }
                    break;
            }
            // Size children panels
            SfPanel child = this.firstChild;
            while (child != null) {
                child.calcSize(context);
                child = child.next;
            }
        }
        return this;
    }

    public SfPanel calcPos(Context context) {

        DisplayMetrics metrics = Resources.getSystem().getDisplayMetrics();
        if (this.parent == null) {
            // Root panel
            this.frame.x = this.origin.left + this.margin.left;
            this.frame.y = this.origin.top + this.margin.top;
        }
        // Position children
        float srcX = 0;
        float srcY = 0;
        float srcW = this.frame.width;
        float srcH = this.frame.height;
        switch (this.alignment) {
            case SF_ALIGNMENT_LEFT:
            case SF_ALIGNMENT_CENTER:
                srcX = (this.scrollHost ? 0 : this.frame.x) + this.padding.left;
                srcY = (this.scrollHost ? 0 : this.frame.y) + this.padding.top;
                break;
            case SF_ALIGNMENT_RIGHT:
                srcX = this.frame.width - this.padding.left;
                srcY = (this.scrollHost ? 0 : this.frame.y) + this.padding.top;
                break;
        }
        float curX = srcX;
        float curY = srcY;
        boolean newLine = true;
        float lineHeight = 0;
        int line = 0;
        // Iterate through children panels
        SfPanel panel = this.firstChild;
        while ( panel != null ) {
            float panelW = panel.frame.width + panel.margin.getWidth();
            float panelH = panel.frame.height + panel.margin.getHeight();
            if (! panel.visible ) continue;
            switch (panel.position) {
                case SF_POSITION_RELATIVE:
                    // Check horizontal alignment
                    switch (this.alignment) {
                        case SF_ALIGNMENT_LEFT:
                            if ( srcW - curX < panelW ) {
                                // Is the panel bigger?
                                curX = srcX;
                                curY += lineHeight;
                                lineHeight = 0;
                                line++;
                            }
                            lineHeight = lineHeight < panelH ? panelH : lineHeight;
                            panel.line = line;
                            panel.frame.x = curX + panel.margin.left;
                            panel.frame.y = curY + panel.margin.top;
                            // Offset the current X
                            curX += panelW;
                            break;
                        case SF_ALIGNMENT_RIGHT:
                            if ( curX - panelW <= 0 ) {
                                // Is the panel bigger?
                                curX = srcX;
                                curY += lineHeight;
                                lineHeight = 0;
                                line++;
                            }
                            lineHeight = lineHeight < panelH ? panelH : lineHeight;
                            panel.line = line;
                            panel.frame.x = curX - (panel.frame.width + panel.margin.left);
                            panel.frame.y = curY + panel.margin.top;
                            // Offset the current X
                            curX -= panelW;
                            break;
                        case SF_ALIGNMENT_CENTER:
                            if ( panelW > srcW - curX ) {
                                // Is the panel bigger?
                                curX = srcX;
                                curY += lineHeight;
                                lineHeight = 0;
                                line++;
                            }
                            lineHeight = lineHeight < panelH ? panelH : lineHeight;
                            panel.line = line;
                            panel.frame.x = curX + panel.margin.left;
                            panel.frame.y = curY + panel.margin.top;
                            // Offset the current X
                            curX += panelW;
                    }
                    break;

                case SF_POSITION_ABSOLUTE: // Revision 4

                    float parentRight = this.frame.x + this.frame.width - this.margin.right;
                    panel.frame.x = (panel.origin.left != SF_UNSET) ? (this.frame.x + panel.origin.left + panel.margin.left) : (parentRight - (panelW + panel.origin.right));

                    float parentBottom = this.frame.y + this.frame.height - this.margin.bottom;
                    panel.frame.y = (panel.origin.top != SF_UNSET) ? (this.frame.y + panel.origin.top + panel.margin.top) : (parentBottom - (panelH + panel.origin.bottom));

                    break;

                case SF_POSITION_FIXED:
                    //if (panel.origin.left == SF_UNSET || panel.origin.right == SF_UNSET) {
                    // This time is relative TO the screen size
                    panel.frame.x = (panel.origin.left != SF_UNSET) ? (panel.origin.left + panel.margin.left) : (metrics.widthPixels - (panelW + panel.origin.right));
                    //}
                    //if (panel.origin.top == SF_UNSET || panel.origin.bottom == SF_UNSET) {
                    // This time is relative TO the screen size
                        /*ActionBar actionbar = ((ActionBarActivity)context).getSupportActionBar();
                        boolean fullScreen = (((ActionBarActivity)context).getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_FULLSCREEN) != 0;*/

                    ActionBar actionbar = ((AppCompatActivity)context).getSupportActionBar();
                    boolean fullScreen = (((AppCompatActivity)context).getWindow().getAttributes().flags & WindowManager.LayoutParams.FLAG_FULLSCREEN) != 0;
                    boolean actionbarVisible = actionbar != null ? actionbar.isShowing() : false;
                    int offset = 0;
                    if (!fullScreen) {
                        int resourceId = Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android");
                        offset += resourceId > 0 ? Resources.getSystem().getDimensionPixelSize(resourceId) : 0;
                    }
                    if (actionbarVisible) {
                        TypedValue tv = new TypedValue();
                        context.getTheme().resolveAttribute(android.R.attr.actionBarSize, tv, true);
                        offset += context.getResources().getDimensionPixelSize(tv.resourceId) + 12;
                    }
                    panel.frame.y = (panel.origin.top != SF_UNSET) ? (panel.origin.top + panel.margin.top) : (metrics.heightPixels - (offset + panelH + panel.origin.bottom));
                    //}
                    break;
            }
            // Layout its children too
            panel.calcPos(context);
            // Increment iterator
            panel = panel.next;
        }
        // Second pass to center children
        if (this.alignment == SF_ALIGNMENT_CENTER) {
            float[] lineWidths = new float[line + 1];
            float[] lineHeights = new float[line + 1];
            panel = this.firstChild;
            // Measure
            while (panel != null) {
                if (panel.position == SF_POSITION_RELATIVE) {
                    float panelW = panel.frame.width + panel.margin.getWidth();
                    float panelH = panel.frame.height + panel.margin.getHeight();
                    // Add to the line width
                    lineWidths[panel.line] += panelW;
                    lineHeights[panel.line] = lineHeights[panel.line] >= panelH ? lineHeights[panel.line] : panelH;
                }
                // Increment iterator
                panel = panel.next;
            }
            // Iterate the lines
            this.scrollHeight = 1000;
            for (int i = 0; i < lineWidths.length; i++) {
                lineWidths[i] = (srcW / 2) - (lineWidths[i] / 2);
                this.scrollHeight += lineHeights[i];
            }
            // Now move the panels
            panel = this.firstChild;
            while ( panel != null ) {
                if (panel.position == SF_POSITION_RELATIVE) {
                    float panelW = panel.frame.width + panel.margin.getWidth();
                    // Get the line width we're working on
                    panel.frame.x = lineWidths[panel.line] + ((panel.parent != null) ? panel.parent.frame.x : 0); // Revision 3.2
                    lineWidths[panel.line] += panelW;
                }
                // Next panel
                panel = panel.next;
            }
        }
        if (this.size.height == 0 && this.position == SF_POSITION_RELATIVE) {
            this.frame.height = this.scrollHeight + 2000;
        }
        return this;
    }

    public SfPanel update(Context context) {

        AbsoluteLayout.LayoutParams params;

        this.calcSize(context);
        this.calcPos(context);
        //
        if ( this.scrollHost && this.fixScroll ) {
            int cachito = (int)( this.frame.height * new SfScreen(context).getDpY(5) ) / 2560;

            params = new AbsoluteLayout.LayoutParams( (int)this.frame.width, (int)this.frame.height - cachito, (int)this.frame.x, (int)this.frame.y );
        } else {
            params = new AbsoluteLayout.LayoutParams( (int)this.frame.width, (int)this.frame.height, (int)this.frame.x, (int)this.frame.y );
        }

        // Setting size to the view
        if (this.view != null) {
            this.view.setLayoutParams(params);
        }

        // Size children panels
        SfPanel child = this.firstChild;
        while (child != null) {
            child.update(context);
            child = child.next;
        }
        return this;
    }
}