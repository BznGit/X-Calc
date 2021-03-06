unit Operands;

interface
uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls;
  type
   TDataSTR = array of string;
    function  GRAD(rad:extended): Extended;
    function  RAD(grad:extended): Extended;
    function  VYVOD (s:extended):String;
    procedure MULTIPLY(A, B :extended; var C :extended);
    procedure DIVIDE(A, B :extended; var C :extended);
    procedure PLUS(A, B :extended; var C :extended);
    procedure MINUS(A, B :extended; var C :extended);
    procedure ALGPLUS(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
    procedure ALGMINUS(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
    procedure ALGMULTIPLY(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
    procedure ALGDIVIDE(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
    procedure EXPTOALG(Am, psi: extended; var Re, Im: extended);
    procedure ALGTOEXP(Re, Im: extended; var Am,psi:extended);
    procedure SOLVER(Chislo: TDataSTR; var  resRe, resIm  :extended);
    procedure PROCESSING(s:string; var g: string; var brk: boolean);

implementation

// ????????? ??????? ????? ????? -----------------------------------------------
function VYVOD(S:extended):String;
begin
  if trunc(S)=S then Result:=FloatToStr(S) else Result:=FloatToStrf(S, fffixed,8, 3);
 if pos(',000', RESULT)<>0 then  RESULT:=(copy(RESULT,1,pos(',', RESULT)-1));

end;
// ??????? ? ??????? -----------------------------------------------------------
function GRAD(rad:extended): Extended; //  ??????? ? ???????
 begin
  Result:=rad*180/PI;
 end;
// ?????? ? ??????? ------------------------------------------------------------
function RAD(grad:extended): Extended; //  ??????? ? ???????
 begin
  Result:=grad*PI/180;
 end;
// ?????????  ------------------------------------------------------------------
procedure MULTIPLY(A, B :extended; var C :extended);
begin
  C:=A*B;
end;
// ???????  --------------------------------------------------------------------
procedure DIVIDE(A, B :extended; var C :extended);
begin
  if (a=0) and (b=0) then
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'? ??????-?? ????? ????????????????, ????????????? ?? ??????? ????????')  ;
    exit;
  end;

  if b=0 then
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'? ??????-?? ????? ?????????????')  ;
    exit;
  end;

  C:=A/B;
end;
// ???????? --------------------------------------------------------------------
procedure PLUS(A, B :extended; var C :extended);
begin
  C:=A+B;
end;
// ????????? ??????????? ????? ? ???. ????? ------------------------------------
procedure MINUS(A, B :extended; var C :extended);
begin
  C:=A-B;
end;
//???????? ??????????? ????? ? ???. ????? --------------------------------------
procedure ALGPLUS(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);

begin
   Re:=Re1 + Re2;
   Im:=Im1 + Im2;
end;
// ????????? ??????????? ????? ? ???. ????? ------------------------------------
procedure ALGMINUS(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
begin
   Re:=Re1 - Re2;
   Im:=Im1 - Im2;
end;
// ????????? ??????????? ????? ? ???. ????? ------------------------------------
procedure ALGMULTIPLY(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
begin
   Re:=Re1*Re2 - Im1*Im2;
   Im:=Re1*Im2 + Re2*Im1;
end;
// ??????? ??????????? ????? ? ???. ????? --------------------------------------
procedure ALGDIVIDE(Re1, Im1, Re2, Im2:extended; var Re, Im:extended);
var
  chRe, znRe, chIm, znIm: extended;
begin
   chRe:=(Re1*Re2 + Im1*Im2);
   znRe:=(Re2*Re2+Im2*Im2);

   chIm:=(Re2*Im1 - Re1*Im2);
   znIm:=(Re2*Re2+Im2*Im2);

   //if chIm=0 then chIm:=1;

   Re:=chRe/znRe;
   Im:=chIm/znIm;


   //Re:=(Re1*Re2 + Im1*Im2)/(Re2*Re2+Im2*Im2);
   //Im:=(Re2*Im1 - Re1*Im2)/(Re2*Re2+Im2*Im2);
end;
// ??????? ??????????? ????? ?? ???. ? ?????. ????? ----------------------------
procedure EXPTOALG(Am, psi: extended; var Re, Im: extended);
begin
   if (psi=90) or (psi=-90) or (psi=-90) or (psi=-270) then
   begin
     Re:=0;
     Im:=Am*sin(psi*pi/180);
     exit;
   end;

   if (psi=180) or (psi=-180) then
   begin
     Im:=0;
     Re:=Am*cos(psi*pi/180);
     exit
   end;

   if (psi=360) or (psi=-360) then
   begin
     Im:=0;
     Re:=Am*cos(psi*pi/180);
     exit
   end;



   Re:=Am*cos(psi*pi/180);
   Im:=Am*sin(psi*pi/180);
end;
// ??????? ??????????? ????? ?? ?????. ? ???. ????? ----------------------------
procedure ALGTOEXP(Re, Im: extended; var Am,psi:extended);
begin

   Am:=sqrt(sqr(Re)+sqr(Im));
   if (Re=0) and (Im>0) then psi:=90;
   if (Re=0) and (Im<0) then psi:=-90;
   if (Re<>0)  then psi:=(arctan(Im/Re))*180/pi;

   if ((Re<0) and (Im<0)) or ((Re<0) and (Im>0)) then   psi:=psi+180;
   if psi>180 then psi:=psi-360;
end;
// ?????? ????? ? ?????????? ?????????????? ???????? ---------------------------
procedure SOLVER(Chislo: TDataSTR; var  resRe, resIm  :extended);
type
 Tmass1D = array of extended;

var
  ex, al, Arifmetic :boolean;
  a, b, Re, Im  :string;
  i,j: integer;
  Mdl, fsa, Dst, Mnim:Tmass1D;
  ll, mm, k, s: Integer;

begin

  ex:=false;
  al:=false;
  Arifmetic:=false;

  for k := 0 to 2 do
  begin

    SetLength( Mdl,  3);
    SetLength( fsa,  3);
    SetLength( Dst,  3);
    SetLength( Mnim, 3);

    if ((pos('exp', Chislo[k])=0) and (pos('j', Chislo[k])=0)) and
    ((Chislo[k]<>'+') and (Chislo[k]<>'-') and (Chislo[k]<>'*') and (Chislo[k]<>'/')) then
    begin
      Arifmetic:=true;
      Mdl[k]:=StrToFloat(Chislo[k]);
      Dst[k]:=StrToFloat(Chislo[k]);
    end;

    if pos('exp', Chislo[k])<>0 then
    begin
      ex:=true;
      i:=pos('exp', Chislo[k])-1;
      a:=copy(Chislo[k],1,i) ;
      // ????  ???????? ????????????? ------------------------------------------
      if pos('-j', Chislo[k])=0 then
      begin
        j:=pos('j', Chislo[k])+1;
        b:=copy(Chislo[k],j,Length(Chislo[k])-j) ;
      end;
      if pos('-j', Chislo[k])<>0 then
      begin
        j:=pos('j', Chislo[k])+1;
        b:='-'+copy(Chislo[k],j,Length(Chislo[k])-j) ;
      end;
      EXPTOALG(StrToFloat(a),StrToFloat(b),Dst[k],Mnim[k]);

    end;
    //????????? ?????????????? ????? -------------------------------------------
   if ((pos('j', Chislo[k]))<>0)  and (pos('exp', Chislo[k])=0) then
    begin

      al:=true;
      i:=pos('j', Chislo[k])-2;

      ll:= pos('+j', Chislo[k]);
      mm:= pos('-j', Chislo[k]);
      if (pos('+j', Chislo[k])=1) or (pos('-j', Chislo[k])=1) then
      Re:='0'
      else
      Re:=copy(Chislo[k],1,i) ;

      j:=pos('j', Chislo[k])+1;
      Im:=copy(Chislo[k],j,Length(Chislo[k])-j+1) ;

      if pos('-j', Chislo[k])<>0 then Im:='-'+Im;

      Dst[k]:=StrToFloat(Re);
      Mnim[k]:=StrToFloat(Im);

    end;

  end;

   if (Arifmetic=true) and (ex=false) and (al=false) then
  begin
    if Chislo[1]='+' then PLUS    (MDL[0],MDL[2], resRe);
    if Chislo[1]='-' then MINUS   (MDL[0],MDL[2], resRe);
    if Chislo[1]='*' then MULTIPLY(MDL[0],MDL[2], resRe);
    if Chislo[1]='/' then DIVIDE  (MDL[0],MDL[2], resRe);
  end
  else
  begin
    if Chislo[1]='+' then ALGPLUS    (Dst[0],Mnim[0], Dst[2],Mnim[2], resRe, resIm);
    if Chislo[1]='-' then ALGMINUS   (Dst[0],Mnim[0], Dst[2],Mnim[2], resRe, resIm);
    if Chislo[1]='*' then ALGMULTIPLY(Dst[0],Mnim[0], Dst[2],Mnim[2], resRe, resIm);
    if Chislo[1]='/' then ALGDIVIDE  (Dst[0],Mnim[0], Dst[2],Mnim[2], resRe, resIm);
  end;

  Mdl    :=nil;
  fsa    :=nil;
  Dst    :=nil;
  Mnim   :=nil;
  Chislo :=nil;

end;
// ??????????? ? ???????? ???????? ?????? --------------------------------------
procedure PROCESSING(s:string; var g: string; var BRK: boolean);
begin
  BRK:=false;

  // ???????? ?????? ??????? ---------------------------------------------------
  if (Length(s)=0) or (s =' ') then
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ????????.');
    BRK:=true;
    exit;
  end;
  // ???????? ??????? exp ------------------------------------------------------
  if pos('exp',s)<>0  then
  begin
    // ??????? (1) ????? exp ---------------------------------------------------
    if pos('exp', s)=1 then
    begin
      insert('1',s,1);
      //memo1.Lines[memo1.CaretPosition.Line]:=s;
    end;
    // ???????? ??????? ????????? ? exp-----------------------------------------
    if (pos('(j', s) = Length(s)-1) or (pos('(-j', s) = Length(s)-2) or (pos(')', s) = Length(s)-1) then begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ???????? ??????????: EXP(j?).');
    BRK:=true;
    exit;
    end
  else
    // ???????? ?????????? ? ?????????? ?????? ?????? exp-----------------------
    if pos(')',s)=0 then g:=s+')';
   end;
  // ???????? ??????? ???. ?????------------------------------------------------
  if (pos('j', s)<>0) and (pos('exp', s)=0)  then
  begin
    // ??????? (1) ????? (j) ---------------------------------------------------
    if pos('j',s)=Length(s) then g:=s+'1';
  end;
end;

end.
