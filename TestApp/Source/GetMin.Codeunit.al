codeunit 90002 GetMin
{
    procedure GetMin(P1: Integer; P2: Integer): Integer
    begin
        case true of
            P1 < P2:
                exit(P1);
            P2 < P1:
                exit(P2);
            else
                exit(P1);
        end;
    end;
}