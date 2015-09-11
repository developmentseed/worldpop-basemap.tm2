@scale-8: #084081;
@scale-7: #0868ac;
@scale-6: #2b8cbe;
@scale-5: #4eb3d3;
@scale-4: #7bccc4;
@scale-3: #a8ddb5;
@scale-2: #ccebc5;
@scale-1: #e0f3db;
@scale-0: #f7fcf0;


@break-8: 256;
@break-7: 128;
@break-6: 64;
@break-5: 32;
@break-4: 16;
@break-3: 8;
@break-2: 4;
@break-1: 2;

#coverage {
  polygon-fill: @scale-0;
}

#population[zoom >= 11],
#population-grid[zoom < 11] {
    polygon-fill: @scale-0;
    [density>=@break-1] { polygon-fill: @scale-1; }
    [density>=@break-2] { polygon-fill: @scale-2; }
    [density>=@break-3] { polygon-fill: @scale-3; }
    [density>=@break-4] { polygon-fill: @scale-4; }
    [density>=@break-5] { polygon-fill: @scale-5; }
    [density>=@break-6] { polygon-fill: @scale-6; }
    [density>=@break-7] { polygon-fill: @scale-7; }
    [density>=@break-8] { polygon-fill: @scale-8; }
}