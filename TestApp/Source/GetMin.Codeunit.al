codeunit 90002 GetMin
{
    procedure GetMin(P1: Integer; P2: Integer): Integer
    begin
        if P1 < P2 then
            exit(P1);
        if P2 < P1 then
            exit(P2);
        if P1 = P2 then
            exit(P1);
    end;
}