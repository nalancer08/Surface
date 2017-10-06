# Surface

Surface it's a layout engine to create prototypes and complete apps so faster


# Examples

## Creating a grid

```
for (int i = 0; i <100; i++) {

    SfPanel cachito = new SfPanel();
    View vii = new View(this.context);

    Integer c1 = i + (int)(Math.random() * ((255 - i) + i));
    Integer c2 = i + (int)(Math.random() * ((254 - i) + i));
    Integer c3 = i + (int)(Math.random() * ((253 - i) + i));

    vii.setBackgroundColor(Color.rgb(c1, c2, c3));

    this.screen.append(cachito);
    cachito.setSize(-33.33333f, -10).setView(vii);//.setMargin(i*5,0,0,0);
    this.addView(vii);
}

this.screen.update(this.context);

```
