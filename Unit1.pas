unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Edit6: TEdit;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  d0,d1,d2,d3,d4:real;
  max1,max2,max3,max4,CDG,zbytek:real;
  m1,m2,m3,m4,CRP:integer;
  RP:array[1..1000,0..4] of real;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,k,l: Integer;
begin
  d0:=StrToFloat(Form1.Edit1.Text);   //d0:=2;
  d1:=StrToFloat(Form1.Edit2.Text);
  d2:=StrToFloat(Form1.Edit3.Text);
  d3:=StrToFloat(Form1.Edit4.Text);
  d4:=StrToFloat(Form1.Edit5.Text);
  max1:=int(d0/d1);
  max2:=int(d0/d2);
  max3:=int(d0/d3);
  max4:=int(d0/d4);
  m1:=round(max1);
  m2:=round(max2);
  m3:=round(max3);
  m4:=round(max4);
  CRP:=1;
  for i := 0 to m1 do
    for j := 0 to m2 do
      for k := 0 to m3 do
        for l := 0 to m4 do
          begin
            CDG:=d1*i+ d2*j+ d3*k+ d4*l;
            zbytek:=d0-CDG;
            if ((CDG<=d0) and (zbytek<0.1)) then
              begin
                RP[CRP,1]:=i;
                RP[CRP,2]:=j;
                RP[CRP,3]:=k;
                RP[CRP,4]:=l;

                RP[CRP,0]:=zbytek;
                Inc(CRP);
                Form1.Edit6.text:=FloatToStr(CRP-1);
              end;
          end;
end;

end.
