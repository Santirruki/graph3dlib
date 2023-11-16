unit spc_obj;

{$mode ObjFPC}{$H+}

interface uses Classes, SysUtils;

type
  TPoint_3D = class
    pos : array[1..3] of double;
  end;
  TPoint_2D = class
    pos : array[1..2] of double;
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
    pos : array[1..3] of double;
    angle : array[1..3] of double;
    fov : real;
    render_distance : array[1..2] of double;
    aspect_ratio : real;

    procedure setaspra(width, height : double);
  end;

implementation
  procedure TCamera.setaspra(width, height : double);
    begin
      aspect_ratio := width/height;
    end;

end.

