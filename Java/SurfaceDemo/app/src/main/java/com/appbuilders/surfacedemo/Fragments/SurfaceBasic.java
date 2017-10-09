package com.appbuilders.surfacedemo.Fragments;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import com.appbuilders.surfacedemo.R;

public class SurfaceBasic extends Fragment {

    public SurfaceBasic() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View view = inflater.inflate(R.layout.fragment_surface_basic, container, false);


        Button button = view.findViewById(R.id.buttonFragemnt);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getContext(), "Fragment logic button", Toast.LENGTH_SHORT).show();
            }
        });

        return view;
    }
}
