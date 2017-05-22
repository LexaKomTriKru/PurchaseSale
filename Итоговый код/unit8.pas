unit Unit8;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls;

type

  { TForm8 }

  TForm8 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    MySQL50Connection1: TMySQL50Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form8: TForm8;

implementation
uses Unit1;

{$R *.lfm}

{ TForm8 }

procedure TForm8.Button1Click(Sender: TObject);
var
    str_sql : string;
begin
        Unit1.Form1.DBGrid1.DataSource:=Form8.DataSource1;
        SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('select act.id, seller.name, act.idshoppers, act.idseller, act.price, act.metofpay, act.volume, act.claims from act join seller on act.id=seller.id;');
        SQLQuery1.Open;
        Form8.Close;
end;

procedure TForm8.Button2Click(Sender: TObject);
var
    str_sql : string;
begin
             Unit1.Form1.DBGrid1.DataSource:=Form8.DataSource1;
        SQLQuery1.Active := false;
        SQLQuery1.SQL.Clear;
        str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
        SQLQuery1.sql.add(str_sql);
        SQLQuery1.ExecSQL;
        SQLQuery1.SQL.Clear;
        SQLQuery1.sql.add('select act.id, seller.name, act.idshoppers, act.idseller, act.price, act.metofpay, act.volume, act.claims from act join seller on act.id=seller.id where seller.name='+#39+Edit1.text+#39+';');
        SQLQuery1.Open;
        Form8.Close;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin

end;

end.

