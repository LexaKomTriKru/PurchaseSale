unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
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
  Form6: TForm6;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.Button1Click(Sender: TObject);
begin
     SQLQuery1.Close;
     SQLQuery1.SQL.Clear;
     if (CheckBox1.Checked = true) then
     SQLQuery1.sql.add('INSERT INTO act (idshoppers,idseller, price, metofpay, volume,claims) VALUES  ('+Edit1.Text+', '+Edit2.Text+', '+Edit3.Text+', '+#39+Edit4.Text+#39+', '+Edit5.Text+', 1);');
     if (CheckBox1.Checked = false)then
     SQLQuery1.sql.add('INSERT INTO act (idshoppers,idseller, price, metofpay, volume,claims) VALUES  ('+Edit1.Text+', '+Edit2.Text+', '+Edit3.Text+', '+#39+Edit4.Text+#39+', '+Edit5.Text+', 0);');

     SQLQuery1.ExecSQL;
     SQLTransaction1.Commit;
     Form6.Close;
end;

end.

