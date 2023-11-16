unit spc_obj;

{$mode ObjFPC}{$H+}

interface uses Classes, SysUtils;

type
  TPoint_3D = class
    pos : array[1..3] of real;
  end;
  TPoint_2D = class
    pos : array[1..2] of real;
  end;
  TPolygon_3D = class
    pnts : array [1..3] of TPoint_3D;
  end;
  TPolygon_2D = class
    pnts : array [1..3] of TPoint_2D;
  end;
  TMesh_3D = class
    plgns : array of TPolygon_3D;
  end;
  TMesh_2D = class
    plgns : array of TPolygon_2D;
  end;
  TCamera = class
    pos : array[1..3] of real;
    angle : array[1..3] of real;
    fov : real;
    render_distance : array[1..2] of real;
    aspect_ratio : real;

    procedure setaspra(width, height : real);
  end;

implementation
  procedure TCamera.setaspra(width, height : real);
    begin
      aspect_ratio := width/height;
    end;

end.

