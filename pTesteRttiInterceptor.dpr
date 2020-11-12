program pTesteRttiInterceptor;

uses
  Vcl.Forms,
  Test.RttiInterceptor in 'Test.RttiInterceptor.pas' {formTestRttiInterceptor},
  Assis.RttiInterceptor in 'Assis.RttiInterceptor.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformTestRttiInterceptor, formTestRttiInterceptor);
  Application.Run;
end.
