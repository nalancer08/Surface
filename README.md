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
  <td width="80%">
  	<pre lang="java">

	public class TabBar extends TabBarControl {

	    public TabBar(SurfaceActivityView view, 
	    					TabBarControlListener listener, int position) {

    		super(view, listener);
    		this.initialize(position);
		}


	    public void initialize(int position) {

	        this.initialize(5, position);
	        this.create();
	    }
	}

	@Override
	public void onCreateView() {

    	TabBar tabBar = new TabBar(this, this, 2);
	}
  </td>
  <td>
      <img src="/Images/example_tabbar.png" height="100%">
  </td>
  </tr>

