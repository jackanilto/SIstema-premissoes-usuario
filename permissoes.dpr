program permissoes;

uses
  Vcl.Forms,
  uacesso in 'uacesso.pas' {facesso},
  uusuarios in 'uusuarios.pas' {fusuarios},
  utela in 'utela.pas' {ftela};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfacesso, facesso);
  Application.CreateForm(Tftela, ftela);
  Application.CreateForm(Tfusuarios, fusuarios);
  Application.CreateForm(Tftela, ftela);
  Application.CreateForm(Tfacesso, facesso);
  Application.CreateForm(Tftela, ftela);
  Application.CreateForm(Tfusuarios, fusuarios);
  Application.CreateForm(Tfusuarios, fusuarios);
  Application.CreateForm(Tftela, ftela);
  Application.CreateForm(Tfusuarios, fusuarios);
  Application.CreateForm(Tfusuarios, fusuarios);
  Application.CreateForm(Tftela, ftela);
  Application.Run;
end.
