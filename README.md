<p align="center">
  <img src="https://github.com/nalancer08/ABAIS/blob/master/logo.png">
</p>

# Surface Engine

Surface Engine it's a layout engine to create prototypes and complete apps so faster


# Examples

### Grids

<table>

  <tr>
  <td width="80%">
    <pre lang="java">

	for (int i = 0; i <100; i++) {

 		SfPanel cachito = new SfPanel();
 		View vii = new View(this.context);

		Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
		Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
		Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

		vii.setBackgroundColor(Color.rgb(c1, c2, c3));
		this.screen.append(cachito);
		cachito.setSize(-33.33333f, -10).setView(vii);
		this.addView(vii);
	}
	this.screen.update(this.context);
  </td>
  <td>
      <img src="/Images/example_grid.png" height="100%">
  </td>
  </tr>

  <tr>
  <td width="80%">
  	<pre lang="java">

	for (int i = 0; i <100; i++) {

 		SfPanel cachito = new SfPanel();
 		View vii = new View(this.context);

		Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
		Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
		Integer c3 = i + (int)(Math.random() * ((253 - i) + i));



		vii.setBackgroundColor(Color.rgb(c1, c2, c3));
		this.screen.append(cachito);
		cachito.setSize(-33.33333f, -10).setView(vii).setMargin((i*5), 0, 0 ,0);
		this.addView(vii);
	}
	this.screen.update(this.context);
  </td>
  <td>
      <img src="/Images/example_grid_margin_top.png" height="100%">
  </td>
  </tr>
</table>


### TabBarControl

<table>

  <tr>
  <td width="80%" overflow="scroll">
  	<pre lang="java">

  	TabBarControl custom class

	public class TabBar extends TabBarControl {

	    public TabBar(SurfaceActivityView view, 
				    TabBarControlListener listener, int position) {

	        super(view, listener, position);
	    }

	    @Override
	    public void setTabs() {

	        this.tabBarItems = new ArrayList<>();

	        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), 
				"\uf015", MainActivity.class, Color.CYAN, Color.GREEN));

	        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), 
				"\uf016", TabBar1.class, Color.CYAN, Color.GREEN));

	        this.tabBarItems.add(TabBarItem.createBasicItem(this.getContext(), 
				"\uf017", TabBarScroll.class, Color.CYAN, Color.GREEN));
	    }
	}

	SurfaceActivityView instance
	
	@Override
	public void onCreateView() {

    	TabBar tabBar = new TabBar(this, this, 1);
	}
  </td>
  <td width="20%">
      <img src="/Images/example_tabbar.png" height="100%">
  </td>
  </tr>
</table>


### Scroll

<table>

  <tr>
  <td width="80%" overflow="scroll">
  	<pre lang="java">
    @Override
    public void onCreateView() {

        this.tabBar = new TabBar(this, this, 2);

        View bk = new View(this.context);
        bk.setBackgroundColor(Color.BLACK);
        this.screen.setView(bk);
        this.addView(bk);

        View bodyBk = new View(this.context);
        bodyBk.setBackgroundColor(Color.BLACK);
        this.body.setView(bodyBk);
        this.addView(bodyBk);

        SfPanel scrollBody = new SfPanel().setSize(-100, -100);
        this.body.append(scrollBody);
        this.makeItScrollable(scrollBody, "scrollBody");

        for (int i = 0; i < 200; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
            Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
            Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

            vii.setBackgroundColor(Color.rgb(c1, c2, c3));

            scrollBody.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii).
            		setMargin(i*5, 0, 20, 0).setKey("i-" + i);
            this.addToScroll("scrollBody", vii);
        }

        scrollBody.getLastChild().setMargin(990, 0, 0, 0);

        this.screen.update(this.context);
    }
  </td>
  <td width="20%">
      <img src="/Images/example_scroll_with_tabbar.png" height="100%">
  </td>
  </tr>
</table>


### Android native XmlLayout combine with Surface Engine

In this example combine native Xml Layouts with the power of Surface Engine
You can watch we use scroll exampe, into the layout provide for the xml

<table>

  <tr>
  <td width="80%" overflow="scroll">
  	<pre lang="java">
    Xml Layout

    <?xml version="1.0" encoding="utf-8"?>
	<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
	    xmlns:app="http://schemas.android.com/apk/res-auto"
	    xmlns:tools="http://schemas.android.com/tools"
	    android:layout_width="match_parent"
	    android:layout_height="match_parent"
	    tools:context="com.appbuilders.surfacedemo.Controllers.HybridXmlSurface"
	    android:paddingLeft="5dp"
	    android:paddingRight="5dp">

	    <AbsoluteLayout
	        android:layout_width="match_parent"
	        android:layout_height="600px"
	        android:background="@color/colorAccent"
	        android:layout_alignParentTop="true"
	        android:layout_alignParentStart="true"
	        android:layout_marginTop="70dp"
	        android:id="@+id/baseLayout">
	    </AbsoluteLayout>

	    <Button
	        android:layout_width="match_parent"
	        android:layout_height="100px"
	        android:background="@color/colorPrimaryDark"
	        android:textColor="@color/white"
	        android:text="Return to main"
	        android:layout_below="@+id/baseLayout"
	        android:layout_alignParentStart="true"
	        android:layout_marginTop="36dp" />

	</RelativeLayout>

	Activity


	public class HybridXmlSurface extends AppCompatActivity {

	    @Override
	    protected void onCreate(Bundle savedInstanceState) {

	        super.onCreate(savedInstanceState);
	        setContentView(R.layout.activity_hybrid_xml_surface);
	        AbsoluteLayout baseLayout = (AbsoluteLayout) findViewById(R.id.baseLayout);

	        HybridXmlSurfaceView view = new HybridXmlSurfaceView(this, baseLayout);

	    }
	}

	SurfaceActivityView instance

	@Override
    public void onCreateView() {

        View boxView = new View(this.context);
        boxView.setBackgroundColor(Color.BLACK);

        SfPanel box = new SfPanel().setSize(-50, -30).
        				setMargin(20, 0, 0, 0).setView(boxView);
        this.subScreen.append(box);
        this.addView(boxView);

        View boxScrollView = new View(this.context);
        boxScrollView.setBackgroundColor(Color.MAGENTA);
        SfPanel boxScroll = new SfPanel().setSize(-85, -65).
        		setMargin(20, 0, 0, 0).setView(boxScrollView);
        this.subScreen.append(boxScroll);
        this.makeItScrollable(boxScroll, "boxScroll");
        //this.addView(boxScrollView);

        for (int i = 0; i < 200; i++) {

            SfPanel cachito = new SfPanel();
            View vii = new View(this.context);

            if (i % 2 == 0) {
                vii.setBackgroundColor(Color.WHITE);
            } else {
                vii.setBackgroundColor(Color.BLACK);
            }

            boxScroll.append(cachito);
            cachito.setSize(-33.33333f, -10).setView(vii).
            		setMargin(i*5, 0, 20, 0).setKey("i-" + i);
            this.addToScroll("boxScroll", vii);
        }

        this.screen.update(this.context);
    }

  </td>
  <td width="20%">
      <img src="/Images/example_native_xml_with_surface.png" height="100%">
  </td>
  </tr>
</table>