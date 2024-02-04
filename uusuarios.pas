unit uusuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Grids, DBGrids, db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfusuarios = class(TForm)
    GroupBox2: TGroupBox;
    cb1: TDBCheckBox;
    cb2: TDBCheckBox;
    cb3: TDBCheckBox;
    cb4: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBComboBox1: TDBComboBox;
    Panel2: TPanel;
    btgravar: TBitBtn;
    btnovo: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btcancelar: TBitBtn;
    btsair: TBitBtn;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    btbuscar: TBitBtn;
    DBGrid1: TDBGrid;
    btlimpar: TBitBtn;
    tbusuarios: TFDTable;
    DataSource1: TDataSource;
    tbusuariosCODUSO: TIntegerField;
    tbusuariosCADUSU: TDateField;
    tbusuariosNOMUSO: TStringField;
    tbusuariosSENUSO: TStringField;
    tbusuariosMENU1: TStringField;
    tbusuariosMENU2: TStringField;
    tbusuariosMENU3: TStringField;
    tbusuariosMENU4: TStringField;
    tbusuariosNIVEL: TStringField;
    procedure btgravarClick(Sender: TObject);
    procedure btnovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btbuscarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btcancelarClick(Sender: TObject);
    procedure btsairClick(Sender: TObject);
    procedure btlimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fusuarios: Tfusuarios;

implementation


{$R *.DFM}

Uses uacesso;

procedure Tfusuarios.btgravarClick(Sender: TObject);
begin
        if tbusuarios.state in [dsinsert, dsedit] then
        begin
           if cb1.Checked = false then tbusuariosMENU1.value := '0';
           if cb2.Checked = false then tbusuariosMENU2.value := '0';
           if cb3.Checked = false then tbusuariosMENU3.value := '0';
           if cb4.Checked = false then tbusuariosMENU4.value := '0';
           tbusuarios.post;
        end;
        btnovo.SetFocus;
end;

procedure Tfusuarios.btnovoClick(Sender: TObject);
begin
        tbusuarios.open;
        tbusuarios.append;
        cb1.Checked := false;
        cb2.Checked := false;
        cb3.Checked := false;
        cb4.Checked := false;
        dbedit1.SetFocus;
end;

procedure Tfusuarios.FormActivate(Sender: TObject);
begin
        cb1.Checked := false;
        cb2.Checked := false;
        cb3.Checked := false;
        cb4.Checked := false;
end;

procedure Tfusuarios.btbuscarClick(Sender: TObject);
begin
        tbusuarios.open;
        tbusuarios.Filtered := false;
        tbusuarios.Filter   := 'Nomuso = '+ QuotedStr(Edit1.Text);
        tbusuarios.Filtered := true;
end;

procedure Tfusuarios.BitBtn1Click(Sender: TObject);
begin
        tbusuarios.open;
        tbusuarios.edit;
        dbedit1.SetFocus;
end;

procedure Tfusuarios.BitBtn2Click(Sender: TObject);
begin
      tbusuarios.open;
      if messagedlg('Confirma exclusão desse usuário?',
      mtConfirmation,[mbyes, mbno],0) = mryes then
      begin
        tbusuarios.delete;
        btsair.setfocus;
      end;
end;

procedure Tfusuarios.btcancelarClick(Sender: TObject);
begin
        tbusuarios.cancel;
        tbusuarios.close;
        btnovo.SetFocus;
end;

procedure Tfusuarios.btsairClick(Sender: TObject);
begin
        close;
end;

procedure Tfusuarios.btlimparClick(Sender: TObject);
begin
        edit1.clear;
        edit1.SetFocus;
        tbusuarios.close;
        cb1.Checked := false;
        cb2.Checked := false;
        cb3.Checked := false;
        cb4.Checked := false;

end;

end.
