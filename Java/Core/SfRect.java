package com.appbuilders.quienesestepoke.libraries.Surface.Core;

public class SfRect extends Object {

    public float x;
    public float y;
    public float width;
    public float height;

    public SfRect() {
        this.x = 0;
        this.y = 0;
        this.width = 0;
        this.height = 0;
    }

    public SfRect(float x, float  y, float width, float height) {
        this.setRect(x, y, width, height);
    }

    public void setRectEmpty() {
        this.x = 0;
        this.y = 0;
        this.width = 0;
        this.height = 0;
    }

    public void setRect(float x, float  y, float width, float height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    public void moveRect(float dx, float dy) {
        this.x += dx;
        this.y += dy;
    }

    public void offsetRect(float dw, float dh) {
        this.width += dw;
        this.height += dh;
    }

    public boolean isEmpty() {
        return (this.x == 0 && this.y == 0 && this.width == 0 && this.height == 0);
    }

    public void unionRec(SfRect rect) {
        if (rect != null) {
            this.width = (rect.x + rect.width) - this.x;
            this.height = (rect.y + rect.height) - this.y;
        }
    }

    public void intersectRect(SfRect rect) {
        if (rect != null) {
            float x2, y2;
            x2 = this.x + this.width;
            y2 = this.y + this.height;
            this.x = rect.x;
            this.y = rect.y;
            this.width = x2 - this.x;
            this.height = y2 - this.y;
        }
    }

    public void subtractRect(SfRect rect) {
        if (rect != null) {
            this.width = rect.x - this.x;
            this.height = rect.y - this.y;
        }
    }

    public boolean pointInRect(SfPoint point) {
        boolean ret = false;
        if (point != null) {
            ret = (point.x >= this.x && point.y >= this.y && point.x <= (this.x + this.width) && point.y <= (this.y + this.height));
        }
        return ret;
    }
}
