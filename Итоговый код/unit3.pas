unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    MySQL50Connection1: TMySQL50Connection;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation
uses Unit1;

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
var
    str_sql : string;
begin
   try
   Unit1.Form1.DBGrid1.DataSource:=Form3.DataSource1;
         if  (RadioButton1.Checked = true) then
   begin
     SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('SELECT * FROM shoppers where name = '+#39+Edit1.Text+#39+';');
        SQLQuery1.Open;
     end;
         if  (RadioButton2.Checked = true) then
   begin
        SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('SELECT * FROM seller where name = '+#39+Edit1.Text+#39+';');
        SQLQuery1.Open;
     end;
  except
   ShowMessage('SQL-запрос: ОШИБКА!');
   exit;
 end;
  Form3.Close;
end;

end.

