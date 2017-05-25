unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DBGrid1: TDBGrid;
    MySQL50Connection1: TMySQL50Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses Unit2,Unit3,Unit4,Unit5,Unit6,Unit7,Unit8,Unit9;
{$R *.lfm}

{ TForm1 }


procedure TForm1.Button2Click(Sender: TObject);
begin
     Unit2.Form2.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Unit4.Form4.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Unit3.Form3.Show;
 end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   Unit5.Form5.Show;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     Unit8.Form8.Show;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    Unit6.Form6.Show;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
    Unit9.Form9.Show;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
    Unit7.Form7.Show;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
    try
   MySQL50Connection1.Connected:=true;
 except
   ShowMessage('Подключение к БД: ОШИБКА!');
   exit;
 end;
 try
   SQLTransaction1.Active:=true;
 except
   ShowMessage('Транзакция: ОШИБКА!');
   exit;
 end;
end;

end.

