unit utela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  Tftela = class(TForm)
    MainMenu1: TMainMenu;
    CADASTROS1: TMenuItem;
    CLIENTES1: TMenuItem;
    N1: TMenuItem;
    PRODUTOS1: TMenuItem;
    ALTERACOES1: TMenuItem;
    CLIENTES2: TMenuItem;
    N2: TMenuItem;
    PRODUTOS2: TMenuItem;
    N3: TMenuItem;
    CONSULTAS1: TMenuItem;
    CLIENTES3: TMenuItem;
    N4: TMenuItem;
    PRODUTOS3: TMenuItem;
    N5: TMenuItem;
    USUARIOS1: TMenuItem;
    CADUSUARIOS1: TMenuItem;
    SAIR1: TMenuItem;
    bar: TStatusBar;
    Timer1: TTimer;
    btnNOVO: TSpeedButton;
    procedure CADUSUARIOS1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SAIR1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ftela: Tftela;

implementation

{$R *.dfm}

uses uusuarios, uacesso;

procedure Tftela.CADUSUARIOS1Click(Sender: TObject);
begin
  fusuarios.showmodal;
end;

procedure Tftela.FormActivate(Sender: TObject);
begin
     bar.Panels[0].text := 'Hoje é '+FormatDateTime('dddddd',date);
     facesso.tbusuarios.open;
     if (facesso.tbusuarios.locate('coduso',facesso.ecoduso.text,[])) and (facesso.tbusuariosNIVEL.value = 'ADMINISTRADOR') then
     begin
         ftela.Cadastros1.Enabled := true;
         ftela.alteracoes1.Enabled := true;
         ftela.consultas1.Enabled := true;
         ftela.btnNOVO.Enabled := true;
         exit;
     end;


     if (facesso.tbusuarios.locate('coduso',facesso.ecoduso.text,[])) and (facesso.tbusuariosMENU1.value = '0')
     then ftela.Cadastros1.Enabled := false;
     if (facesso.tbusuarios.locate('coduso',facesso.ecoduso.text,[])) and (facesso.tbusuariosMENU2.value = '0')
     then ftela.alteracoes1.Enabled := false;
     if (facesso.tbusuarios.locate('coduso',facesso.ecoduso.text,[])) and (facesso.tbusuariosMENU3.value = '0')
     then ftela.consultas1.Enabled := false;
     if (facesso.tbusuarios.locate('coduso',facesso.ecoduso.text,[])) and (facesso.tbusuariosMENU4.value = '0')
     then ftela.btnNOVO.Enabled := false;

     bar.Panels[2].Text := 'Usuário.: '+facesso.qveracessoNOMUSO.Value;
end;

procedure Tftela.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure Tftela.SAIR1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tftela.Timer1Timer(Sender: TObject);
begin
  bar.Panels[1].Text := 'Hora - ' + timetostr(now);
end;

end.
