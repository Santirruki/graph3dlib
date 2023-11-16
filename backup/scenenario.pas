unit scenenario;

{$mode ObjFPC}{$H+}

interface uses Classes, SysUtils, spc_obj;

type
  TScenario = class
    public
      camera : TCamera;
    private
      meshes : array of TMesh_3D;
  end;

implementation

end.

