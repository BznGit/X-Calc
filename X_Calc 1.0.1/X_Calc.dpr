program X_Calc;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form3},
  Operands in 'Operands.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait, TFormOrientation.InvertedPortrait, TFormOrientation.Landscape, TFormOrientation.InvertedLandscape];
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

