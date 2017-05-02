package com.appbuilders.quienesestepoke.libraries.Surface.Core;

public class SfSize extends Object {

    public float width;
    public float height;

    public SfSize() {
        this.width = 0;
        this.height = 0;
    }

    public SfSize(float width ,float height) {
        this.setSize(0, 0);
    }

    public void setSize(float width ,float height) {
        this.width = width;
        this.height = height;
    }

    public boolean isEmpty() {
        return (this.width == 0 && this.height == 0);
    }
}
