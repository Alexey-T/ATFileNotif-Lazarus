unit ATFileNotif_Reg;

interface

uses
  SysUtils, Classes, Controls, LResources, ATFileNotif;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AT Controls', [TATFileNotif]);
end;

initialization
  {$I res/icon.lrs}

end.
