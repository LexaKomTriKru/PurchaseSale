unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql50conn, sqldb, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ExtCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MySQL50Connection1: TMySQL50Connection;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.Button1Click(Sender: TObject);
var
  flag : integer;
  sql1,sql2,sql3,sql4,sql5,sql6:integer;
  str_sql : string;
begin
 try
       if  (RadioButton1.Checked = true) then
 begin
      //SQLQuery1.Active := false;
      flag:=0;
      sql1:=0;
      sql2:=0;
      sql3:=0;
      sql4:=0;
      sql5:=0;
      sql6:=0;
      SQLQuery1.SQL.Clear;
      str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
      SQLQuery1.sql.add(str_sql);
      SQLQuery1.ExecSQL;
      SQLQuery1.SQL.Clear;
      str_sql := 'UPDATE shoppers SET ';
      if  (CheckBox1.Checked = true) and (flag=0) then
      begin
      str_sql :=str_sql+ 'name='+#39+Edit2.Text+#39;
      flag:=1;
      sql1:=1;
      end;
      if  (CheckBox2.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'volume='+Edit3.Text;
      flag:=1;
      sql2:=1;
      end;
      if  (CheckBox3.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'price='+Edit4.Text;
      flag:=1;
      sql3:=1;
      end;
      if  (CheckBox4.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'metofpay = '+#39+Edit5.Text+#39;
      flag:=1;
      sql4:=1;
      end;
      if  (CheckBox5.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'contacts='+#39+Edit6.Text+#39;
      flag:=1;
      sql5:=1;
      end;
      if  (CheckBox6.Checked = true) and (flag=0) then
      begin
      str_sql :=str_sql+ 'notes='+#39+Edit7.Text+#39;
      flag:=1;
      sql6:=1;
      end;

      if  (CheckBox2.Checked = true) and (flag=1) and (sql2<>1) then
      str_sql :=str_sql+', '+ 'volume ='+Edit3.Text;
      if  (CheckBox3.Checked = true)and (flag=1)and (sql3<>1) then
      str_sql :=str_sql+', '+ 'price ='+Edit4.Text;
      if  (CheckBox4.Checked = true) and (flag=1)and (sql4<>1)then
      str_sql :=str_sql+', '+ 'metofpay = '+#39+Edit5.Text+#39;
      if  (CheckBox5.Checked = true)and (flag=1)and (sql5<>1) then
      str_sql :=str_sql+', '+ 'contacts ='+#39+Edit6.Text+#39;
      if  (CheckBox6.Checked = true) and (flag=1)and (sql6<>1) then
      str_sql :=str_sql+', '+ 'notes ='+#39+Edit7.Text+#39;

      str_sql :=str_sql+' WHERE ID = '+Edit1.Text+ ';';
      SQLQuery1.sql.add(str_sql);
      SQLQuery1.ExecSQL;
      SQLTransaction1.Commit;
   end;
       if  (RadioButton2.Checked = true) then
 begin
           flag:=0;
      sql1:=0;
      sql2:=0;
      sql3:=0;
      sql4:=0;
      sql5:=0;
      sql6:=0;
      SQLQuery1.SQL.Clear;
      str_sql := 'SET character_set_client='+#39+'utf8'+#39+',character_set_connection='+#39+'cp1251'+#39+',character_set_results='+#39+'utf8'+#39+';';
      SQLQuery1.sql.add(str_sql);
      SQLQuery1.ExecSQL;
      SQLQuery1.SQL.Clear;
      str_sql := 'UPDATE seller SET ';
      if  (CheckBox1.Checked = true) and (flag=0) then
      begin
      str_sql :=str_sql+ 'name='+#39+Edit2.Text+#39;
      flag:=1;
      sql1:=1;
      end;
      if  (CheckBox2.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'volume='+Edit3.Text;
      flag:=1;
      sql2:=1;
      end;
      if  (CheckBox3.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'price='+Edit4.Text;
      flag:=1;
      sql3:=1;
      end;
      if  (CheckBox4.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'metofpay = '+#39+Edit5.Text+#39;
      flag:=1;
      sql4:=1;
      end;
      if  (CheckBox5.Checked = true)and (flag=0) then
      begin
      str_sql :=str_sql+ 'contacts='+#39+Edit6.Text+#39;
      flag:=1;
      sql5:=1;
      end;
      if  (CheckBox6.Checked = true) and (flag=0) then
      begin
      str_sql :=str_sql+ 'notes='+#39+Edit7.Text+#39;
      flag:=1;
      sql6:=1;
      end;

      if  (CheckBox2.Checked = true) and (flag=1) and (sql2<>1) then
      str_sql :=str_sql+', '+ 'volume ='+Edit3.Text;
      if  (CheckBox3.Checked = true)and (flag=1)and (sql3<>1) then
      str_sql :=str_sql+', '+ 'price ='+Edit4.Text;
      if  (CheckBox4.Checked = true) and (flag=1)and (sql4<>1)then
      str_sql :=str_sql+', '+ 'metofpay = '+#39+Edit5.Text+#39;
      if  (CheckBox5.Checked = true)and (flag=1)and (sql5<>1) then
      str_sql :=str_sql+', '+ 'contacts ='+#39+Edit6.Text+#39;
      if  (CheckBox6.Checked = true) and (flag=1)and (sql6<>1) then
      str_sql :=str_sql+', '+ 'notes ='+#39+Edit7.Text+#39;

      str_sql :=str_sql+' WHERE ID = '+Edit1.Text+ ';';
      SQLQuery1.sql.add(str_sql);
      SQLQuery1.ExecSQL;
      SQLTransaction1.Commit;
   end;
except
 ShowMessage('SQL-запрос: ОШИБКА!');
 exit;
end;
Form4.Close;
end;

procedure TForm4.CheckBox1Change(Sender: TObject);
begin
  if (Edit2.Enabled=False)
  then
   Edit2.Enabled:=True
   else
   Edit2.Enabled:=False;
end;

procedure TForm4.CheckBox2Change(Sender: TObject);
begin
     if (Edit3.Enabled=False)
  then
   Edit3.Enabled:=True
   else
   Edit3.Enabled:=False;
end;

procedure TForm4.CheckBox3Change(Sender: TObject);
begin
     if (Edit4.Enabled=False)
  then
   Edit4.Enabled:=True
   else
   Edit4.Enabled:=False;
end;

procedure TForm4.CheckBox4Change(Sender: TObject);
begin
     if (Edit5.Enabled=False)
  then
   Edit5.Enabled:=True
   else
   Edit5.Enabled:=False;
end;

procedure TForm4.CheckBox5Change(Sender: TObject);
begin
     if (Edit6.Enabled=False)
  then
   Edit6.Enabled:=True
   else
   Edit6.Enabled:=False;
end;

procedure TForm4.CheckBox6Change(Sender: TObject);
begin
     if (Edit7.Enabled=False)
  then
   Edit7.Enabled:=True
   else
   Edit7.Enabled:=False;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin

end;

end.

