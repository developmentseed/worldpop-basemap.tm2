/**
* Modified from https://github.com/mapbox/mapbox-studio-light.tm2 
* ( (c) Mapbox)
*/
// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Fonts //
@fallback: 'Open Sans Regular';
@sans: 'Open Sans Regular', 'Arial Unicode MS Regular';
@sans_md: 'Open Sans Semibold', 'Arial Unicode MS Regular';
@sans_bd: 'Open Sans Bold','Arial Unicode MS Bold';
@sans_it: 'Open Sans Italic', 'Arial Unicode MS Regular';
@sans_bdit: 'Open Sans Bold Italic','Arial Unicode MS Bold';
 
/*
This style is designed to be easily recolored by adjusting the color
variables below. For predicatable feature relationships,
maintain or invert existing value (light to dark) scale.
*/

// Color palette // 
@road:  #fff;
@land:  #edebe6;
// just for waterways (for bodies of water, see #water below)
@water: lighten(#2e2e2e, 30%);

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #000;
@fill5: #7a7a7a;

@text: #333;


Map {
  background-color: @land;
}

// Political boundaries //
#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: @fill5;
  line-width: .2;
  [zoom>=5] { line-width: .4; }
  [zoom>=6] { line-width: .8; }
  [zoom>=8] { line-width: .4; }
  [zoom>=10] { line-width: 3; }
  [disputed=1] { line-dasharray: 4,4; }
}

#admin[admin_level>2][maritime=0] {
  line-join: round;
  line-color: @fill5;
  line-width: .3;
  line-dasharray: 3,2;
  [zoom>=6] { line-width: .5; }
  [zoom>=8] { line-width: 1.2; }
}

// ****************
// Special case hack for nepal admin boundaries.

#npl-admin-2,
#npl-admin-3,
#npl-admin-4,
#npl-admin-5 {
  line-join: round;
  line-color: darken(@fill5, 10%);
  line-width: 0;
}

#npl-admin-2 {
  [zoom>=8] { line-width: 1.8; }
  [zoom>=10] { line-width: 3; }
}

#npl-admin-3 {
  [zoom>=9] { line-width: 0.8; }
  [zoom>=10] { line-width: 1.6; }
}

#npl-admin-4 {
  [zoom>=11] { line-width: 0.8; line-dasharray: 2;}
}


// Land Features //
#landuse[class='cemetery'],
#landuse[class='park'],
#landuse[class='wood'],
#landuse_overlay {
  //polygon-fill: darken(@land,3);
  //[zoom>=15] { polygon-fill:mix(@land,@fill4,95); }
}

#landuse[class='pitch'],
#landuse[class='sand'] { 
  //polygon-fill: mix(@land,@fill4,90);
}

#landuse[class='hospital'],
#landuse[class='industrial'],
#landuse[class='school'] { 
  //polygon-fill: mix(@land,@fill1,95);
}

#building { 
  //polygon-fill: mix(@fill2,@land,25);
  //[zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
}

#aeroway {
  ['mapnik::geometry_type'=3][type!='apron'] { 
    polygon-fill: mix(@fill2,@land,25);
    [zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
  }
  ['mapnik::geometry_type'=2] { 
    line-color: mix(@fill2,@land,25);
    line-width: 1;
    [zoom>=13][type='runway'] { line-width: 4; }
    [zoom>=16] {
      [type='runway'] { line-width: 6; }
      line-width: 3;
      line-color: mix(@fill2,@land,50);
    }
  }
}

@mainwater: #d1e0e4;
// Water Features //
#water {
  ::shadow {
    polygon-fill: mix(@mainwater,@fill4,80);
  }
  ::fill {
    // a fill and overlay comp-op lighten the polygon-
    // fill from ::shadow.
    polygon-fill: @land;
    comp-op: soft-light;
    // blurring reveals the polygon fill from ::shadow around
    // the edges of the water
    image-filters: agg-stack-blur(10,10);
    image-filters-inflate: true;
  }
}


#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.3;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.3;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}
