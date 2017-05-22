unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
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
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.Button1Click(Sender: TObject);
  var
    str_sql : string;
begin
   try
         if  (RadioButton1.Checked = true) then
   begin
     SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('delete FROM  shoppers where id = '+#39+Edit1.Text+#39+';');
        SQLQuery1.ExecSQL;
     SQLTransaction1.Commit;
     end;
         if  (RadioButton2.Checked = true) then
   begin
     SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('delete FROM seller where id = '+#39+Edit1.Text+#39+';');
        SQLQuery1.ExecSQL;
     SQLTransaction1.Commit;
     end;
  except
   ShowMessage('SQL-запрос: ОШИБКА!');
   exit;
 end;
  Form5.Close;
end;

end.

