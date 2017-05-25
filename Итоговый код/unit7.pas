unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    MySQL50Connection1: TMySQL50Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.lfm}

{ TForm7 }

procedure TForm7.Button1Click(Sender: TObject);
var
  str_sql : string;
begin
          SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('delete FROM act where id = '+#39+Edit1.Text+#39+';');
        SQLQuery1.ExecSQL;
     SQLTransaction1.Commit;
     Form7.Close;
end;

end.

