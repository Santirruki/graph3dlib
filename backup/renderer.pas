unit renderer;

{$mode ObjFPC}{$H+}

interface uses Classes, SysUtils, scenenario, matrix, graph;
type
  TRenderer = class
    public
      constructor build;
      procedure renderFrame;
      procedure cleargraph;

    private
      TransformMatrix : Tmatrix4_double;
      scenario : TScenario;
      driver : smallint;
      mode : smallint;
      procedure representOnScreen(x, y : double);
  end;

implementation


  constructor TRenderer.build;
    begin
      scenario.camera.setaspra(GETMAXX,GETMAXY);
      scenario.Create;
      driver := detect;
      mode := VgaHi;
      initgraph(driver,mode,'');
    end;

  procedure TRenderer.renderFrame;
  var i, j, k : integer;
      ipoint : Tvector4_double;
      i2dpoint : array[1..2] of double;
    begin
      updateTransfomMatrix;
      i := 1; j := 1; k := 1;
      while(i <= Length(scenario.meshes)) do //recorre los meshes
        begin
          while(j <= Length(scenario.meshes[i].plgns)) do //recorre los poligonos de los meshes
            begin
              while(k <= Length(scenario.meshes[i].plgns[j].pnts)) do //recorre los puntos de los poligonos de los meshes
                begin
                  ipoint.data[0] := scenario.meshes[i].plgns[j].pnts[k].pos[1];
                  ipoint.data[1] := scenario.meshes[i].plgns[j].pnts[k].pos[2];
                  ipoint.data[2] := scenario.meshes[i].plgns[j].pnts[k].pos[3];
                  ipoint.data[3] := 1;

                  ipoint := TransformMatrix * ipoint;
                  ipoint.data[0] := ipoint.data[0]/ipoint.data[3];
                  ipoint.data[1] := ipoint.data[1]/ipoint.data[3];

                  i2dpoint[1] := ipoint.data[0];
                  i2dpoint[2] := ipoint.data[1];

                  representOnScreen(i2dpoint[1], i2dpoint[2]);
                  ///////
                  inc(k);
                end;
              inc(j);
            end;
          inc(i);
        end;
    end;

  procedure TRenderer.representOnScreen(x, y : double);
    begin

    end;

  procedure TRenderer.cleargraph;
    begin

    end;

end.

