@scale-8: #511414;
@scale-7: #601F1F;
@scale-6: #702B2B;
@scale-5: #823B3B;
@scale-4: #914D4D;
@scale-3: #A35D5D;
@scale-2: #B27070;
@scale-1: #C18989;

@break-8: 256;
@break-7: 128;
@break-6: 64;
@break-5: 32;
@break-4: 16;
@break-3: 8;
@break-2: 4;
@break-1: 2;

#coverage {
  polygon-fill: @scale-1;
}

#population {
  [density>=@break-1] { polygon-fill: @scale-1; }
  [density>=@break-2] { polygon-fill: @scale-2; }
  [density>=@break-3] { polygon-fill: @scale-3; }
  [density>=@break-4] { polygon-fill: @scale-4; }
  [density>=@break-5] { polygon-fill: @scale-5; }
  [density>=@break-6] { polygon-fill: @scale-6; }
  [density>=@break-7] { polygon-fill: @scale-7; }
  [density>=@break-8] { polygon-fill: @scale-8; }
}