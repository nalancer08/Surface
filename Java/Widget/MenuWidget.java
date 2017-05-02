package com.appbuilders.quienesestepoke.libraries.Surface.Widget;

import android.content.Context;
import android.view.View;
import android.view.Window;
import android.widget.ImageView;


import com.appbuilders.quienesestepoke.R;
import com.appbuilders.quienesestepoke.libraries.Surface.Core.Screen;
import com.appbuilders.quienesestepoke.libraries.Surface.SfPanel;
import com.daimajia.androidanimations.library.Techniques;
import com.daimajia.androidanimations.library.YoYo;
import com.nineoldandroids.animation.Animator;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Erick on 29/03/2017.
 */
public abstract class MenuWidget extends Screen {

    private ImageView menuButton;
    private Techniques openTechnique;
    private Techniques closeTechnique;
    private boolean isOpen = false;
    private Screen originaView;
    private List<View> menuElements;

    private SfPanel iterationHide = null;

    public SfPanel window;
        public SfPanel menuPanel;

    public View windowView;
        public View menuView;

    public MenuWidget(Context context, Window window, Screen view) {

        super(context);
        this.windowsCanvas = view.windowsCanvas;
        this.originaView = view;
        this.deleteStatusBar(window);
    }

    public MenuWidget build(View view, Techniques openTechnique, Techniques closeTechnique) {

        this.menuButton = (ImageView) view;
        this.openTechnique = closeTechnique;  //openTechnique;
        this.closeTechnique = openTechnique;  //closeTechnique;
        this.makeCallback();
        this.menuElements = new LinkedList<>();

        return this;
    }

    public MenuWidget onCreate() {

        this.windowsCanvas.setBackgroundResource(R.color.homeBakcgroind);
        return this;
    }

    public MenuWidget onMake() {

        this.windowView = new View(this.context);
        this.windowView.setBackgroundResource(R.color.whiteTrans);

        this.menuView = new View(this.context);
        this.menuView.setBackgroundResource(R.color.guillotine_background);
        this.menuView.bringToFront();

        /** Panels **/
        this.window = new SfPanel();
            this.menuPanel = new SfPanel();

        this.window.setView(this.menuView);
            this.menuPanel.setView(menuView);

        /** Appends **/
        this.window.append(this.menuPanel);

        /** Setting sizes **/
        this.window.setSize(-100, -100).setPadding(0,0,0,0).setOrigin(0,0,0,0).setPosition(SfPanel.SF_ALIGNMENT_RIGHT);
        this.menuPanel.setSize(-55, -100).setZIndex(50).setPosition(SfPanel.SF_ALIGNMENT_RIGHT).setOrigin(0, 0, SfPanel.SF_UNSET, SfPanel.SF_UNSET);//.setPadding(5,5,5,5);

        /** __adding to screen __Remember if you want animations, dont call this method, make the adds in Controller__ **/
        //this.onAddings();

        /** Update **/
        this.window.update(this.context);

        /** Return */
        return this;
    }

    public void setIterationHide(SfPanel panel) {
        this.iterationHide = panel;
    }

    /** Setting the turn on and off **/

    protected void makeCallback() {

        if ( this.menuView != null && this.menuButton != null ) {

            this.menuButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    if ( isOpen == false ) {

                        windowsCanvas.addView(menuView);
                        menuView.bringToFront();
                        menuView.clearFocus();
                        menuButton.bringToFront();
                    }

                    YoYo.with( isOpen == true ? openTechnique : closeTechnique ).duration(500).withListener(new Animator.AnimatorListener() {

                        @Override
                        public void onAnimationStart(Animator animation) {
                            ///open = (open == true) ? false : true;

                            if ( isOpen == true ) {
                                disappearElements();
                            }
                        }

                        @Override
                        public void onAnimationEnd(Animator animation) {

                            if ( isOpen == true ) { // Close menu

                                menuButton.setImageResource(R.drawable.menu_white);
                                YoYo.with(Techniques.BounceInDown).duration(300).playOn(menuButton);
                                windowsCanvas.removeView(menuView);
                                isOpen = false;
                                enableBehindClicks();

                            } else { // Open Menu

                                menuButton.setImageResource(R.drawable.close_arrow);
                                YoYo.with(Techniques.RotateIn).duration(300).playOn(menuButton);
                                isOpen = true;
                                disableBehindClicks();
                                onDrawMenu();
                            }

                        }

                        @Override
                        public void onAnimationCancel(Animator animation) {

                        }

                        @Override
                        public void onAnimationRepeat(Animator animation) {

                        }
                    }).playOn(menuView);
                }
            });

        }
    }

    protected void disableBehindClicks() {

        ArrayList<SfPanel> originals = this.iterationHide.getChildren();
        int childCount = originals.size();

        for ( int i = 0; i < childCount; i++ ) {

            View view = originals.get(i).getView();
            if ( view != null ) {

                view.invalidate();
                view.setClickable(false);
                view.setEnabled(false);
            }
        }
    }

    protected void enableBehindClicks() {

        ArrayList<SfPanel> originals = this.iterationHide.getChildren();
        int childCount = originals.size();

        for ( int i = 0; i < childCount; i++ ) {

            View view = originals.get(i).getView();
            if ( view != null ) {

                view.bringToFront();
                view.setClickable(true);
                view.setEnabled(true);
            }
        }
    }

    public void addMenuElement(View view) {

        this.menuElements.add(view);
    }

    public void disappearElements() {

        for ( int i = 0; i < this.menuElements.size(); i++ ) {

            View view = this.menuElements.get(i);
            view.invalidate();
            view.setClickable(false);
            view.setEnabled(false);
            this.windowsCanvas.removeView(view);
        }
    }

    /**
     * Interface for create elements
     **/
    public abstract void onDrawMenu();

    public boolean isOpen() {
        return this.isOpen;
    }
}
