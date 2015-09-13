unit FormMain;

{$mode objfpc}

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, EditBtn, Spin,
  LclIntf, LclType,
  ATFileNotif;

type
  { TfmMain }

  TfmMain = class(TForm)
    edDelay: TSpinEdit;
    edFileName: TFileNameEdit;
    Label2: TLabel;
    btnWatchFile: TButton;
    btnClose: TButton;
    Label1: TLabel;
    Label3: TLabel;
    procedure btnWatchFileClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FileChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Notif: TATFileNotif;
    procedure NotifyFile;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.lfm}

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Notif:= TATFileNotif.Create(Self);
  Notif.OnChanged:= @FileChanged; 
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  //edFileName.Text:= '';
end;

procedure TfmMain.NotifyFile;
begin
  with Notif do
  begin
    Timer.Enabled:= False;
    Timer.Interval:= edDelay.Value;
    FileName:= edFileName.Text;
    Timer.Enabled:= True;
  end;
end;

procedure TfmMain.FileChanged(Sender: TObject);
begin
  Application.MessageBox(
    'File was changed.'#13+
    'To continue file watching, close this message box.',
    'Notification',
    MB_OK or MB_ICONWARNING);
end;

procedure TfmMain.btnWatchFileClick(Sender: TObject);
begin
  if edFileName.Text<>'' then
    NotifyFile;
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
