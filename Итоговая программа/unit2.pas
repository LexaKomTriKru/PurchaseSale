unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    MySQL50Connection1: TMySQL50Connection;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
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
     try
         if  (RadioButton1.Checked = true) then
   begin
     SQLQuery1.Close;
     SQLQuery1.SQL.Clear;
     SQLQuery1.sql.add('INSERT INTO shoppers  (name,volume, price, metofpay, contacts) VALUES  ('+#39+Edit1.Text+#39+', '+Edit2.Text+', '+Edit3.Text+', '+#39+Edit4.Text+#39+', '+#39+Edit5.Text+#39+');');
     SQLQuery1.ExecSQL;
     SQLTransaction1.Commit;
     end;
         if  (RadioButton2.Checked = true) then
   begin
     SQLQuery1.Close;
     SQLQuery1.SQL.Clear;
     SQLQuery1.sql.add('INSERT INTO seller (name,volume, price, metofpay, contacts) VALUES  ('+#39+Edit1.Text+#39+', '+Edit2.Text+', '+Edit3.Text+', '+#39+Edit4.Text+#39+', '+#39+Edit5.Text+#39+');');
     SQLQuery1.ExecSQL;
     SQLTransaction1.Commit;
     end;
  except
   ShowMessage('SQL-запрос: ОШИБКА!');
   exit;
 end;
     Form2.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.RadioButton1Change(Sender: TObject);
begin

end;

end.

