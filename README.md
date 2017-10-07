<p align="center">
  <img src="https://github.com/nalancer08/ABAIS/blob/master/logo.png">
</p>

# Surface

Surface it's a layout engine to create prototypes and complete apps so faster


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
            cachito.setSize(-33.33333f, -10).setView(vii).setMargin(i*5, 0, 20, 0).setKey("i-" + i);
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