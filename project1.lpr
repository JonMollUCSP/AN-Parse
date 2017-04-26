program project1;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX}{$IFDEF UseCThreads}
     cthreads,
     {$ENDIF}{$ENDIF}
     Classes, SysUtils, CustApp, UArbol, UNodo, ULista, UParse;

type

    { TMyApplication }

    TMyApplication = class(TCustomApplication)
    protected
        procedure DoRun; override;
    public
    end;

{ TMyApplication }

procedure TMyApplication.DoRun;
var objeto : CParse;
begin
    objeto := CParse.Create();
    objeto.m_expresion := '1+2+(1+1)^(1+2)';

    WriteLn(objeto.m_expresion);
    WriteLn( objeto.Evaluar() );

    objeto.Destroy();

    ReadLn;
end;

var Application : TMyApplication;
begin
    Application := TMyApplication.Create(nil);
    Application.Title := 'My Application';
    Application.Run;
    Application.Free;
end.
