package com.appbuilders.surface;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Created by Erick Sanchez - App Builders CTO
 * Version 1 - 09/10/17
 * Revision 1 - 09/10/17
 */

public class SfParser {

    private SurfaceActivityView view;
    private JSONObject baseObject = null;
    private JSONArray baseArray = null;

    public SfParser(SurfaceActivityView view, JSONObject object) {

        this.view = view;
        this.baseObject = object;
        this.initialize();
    }

    public SfParser(SurfaceActivityView view, JSONArray array) {

        this.view = view;
        this.baseArray = array;
        this.initialize();
    }

    private void initialize() {

        if (this.baseObject != null) { // Using the JSONObject

        } else if (this.baseArray != null) { // USing the JSONArray

        }
    }
}
