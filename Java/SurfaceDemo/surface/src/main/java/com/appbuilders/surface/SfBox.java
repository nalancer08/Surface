package com.appbuilders.surface;

/**
 * Created by ercsanchez on 26/09/17.
 */

public class SfBox extends Object {

    public float top;
    public float right;
    public float bottom;
    public float left;

    public SfBox() {

        this.top = 0;
        this.right = 0;
        this.bottom = 0;
        this.left = 0;
    }

    public SfBox(float top, float right, float bottom, float left) {
        this.setBox(top, right, bottom, left);
    }

    public void setBox(float top, float right, float bottom, float left) {
        this.top = top;
        this.right = right;
        this.bottom = bottom;
        this.left = left;
    }

    public float getWidth() {
        return this.left + this.right;
    }

    public float getHeight() {
        return this.top + this.bottom;
    }

    public boolean isEmpty() {
        return (this.top == 0 && this.right == 0 && this.bottom == 0 && this.left == 0);
    }
}