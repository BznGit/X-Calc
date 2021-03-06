unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Gestures,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ScrollBox, FMX.Memo, FMX.Ani, Operands, FMX.ExtCtrls, FMX.Objects,
     FMX.Helpers.Android, Androidapi.Helpers,
    Androidapi.JNI.GraphicsContentViewText  ;


type
  TForm3 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    GestureManager1: TGestureManager;
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Memo1: TMemo;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Button25: TButton;
    Image3: TImage;
    procedure TabControl1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CifButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Sbros;
    procedure FormResize(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Label1Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i                                    : integer;
  Stroka                               : TDataSTR;
  EXP, ALG, mem, drob, vyhod           : boolean;
  Modul, A, S,d, Memory, Rezultat      : string;
  Res, Ims                             : extended;

implementation

{$R *.fmx}

// ????????? ????????? ?????????------------------------------------------------
procedure TForm3.FormCreate(Sender: TObject);
var
  i:integer;
  component: Tcomponent;
begin
  Memo1.Size.Height:=form3.Height/4.4;
  Memo1.Size.Width :=form3.Width;
  Memo1.TextSettings.Font.Size:=memo1.Size.Height/7;
  label1.TextSettings.Font.Size:=label1.Size.Height/2;

  for I := 1 to 24 do
    begin
      component:=FindComponent('Button'+IntToStr(i));
      if nil<> component then (component  as TButton).TextSettings.Font.Size:=(component  as TButton).Size.Height/3;
    end;

  Button22.TextSettings.Font.Size:= Button22.Size.Height/4.5;
  Button21.TextSettings.Font.Size:= Button21.Size.Height/4;
  memo1.Lines.Add('');
  SetLength(Stroka,1) ;
  exp:=false;
  alg:=false;
  s:='';
  d:='';
  mem:=false;
  drob:=false;
   Rezultat:='';
end;
// ??????????????? ?????????----------------------------------------------------
procedure TForm3.FormResize(Sender: TObject);
var
  i:integer;
  component: Tcomponent;
begin
  Memo1.TextSettings.Font.Size:=memo1.Size.Height/7;
  label1.TextSettings.Font.Size:=label1.Size.Height/2.5;
  for I := 1 to 24 do
    begin
      component:=FindComponent('Button'+IntToStr(i));
      if nil<> component then (component  as TButton).TextSettings.Font.Size:=(component  as TButton).Size.Height/3;
    end;
    Button22.TextSettings.Font.Size:= Button22.Size.Height/4.5;
    Button21.TextSettings.Font.Size:= Button21.Size.Height/4;
end;
// ????? ?????? ?? ?????? ------------------------------------------------------
procedure TForm3.Label1Click(Sender: TObject);
var
  Intent: JIntent;
begin
  Intent := TJIntent.Create;
  Intent.setAction(TJIntent.JavaClass.ACTION_VIEW);
  Intent.setData(StrToJURI('https://yasobe.ru/na/razrabotka_obrazovatelnyh_android_prilozhenii'));
  SharedActivity.startActivity(Intent);
end;
// ????????? ??????? ?????? ?????? ???? ?? label1 ------------------------------
procedure TForm3.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
    label1.TextSettings.FontColor:=TAlphaColorrec.Red;
end;
// ????????? ????????? ??????? ?? label1 ---------------------------------------
procedure TForm3.Label1MouseEnter(Sender: TObject);
begin
  Label1.Font.Style := Label1.Font.Style + [TFontStyle.fsBold];
end;
// ????????? ????????? ??????? ?  label1 ---------------------------------------
procedure TForm3.Label1MouseLeave(Sender: TObject);
begin
  Label1.Font.Style := Label1.Font.Style - [TFontStyle.fsBold];
end;
// ????????? ?????????? ?????? ?????? ???? ?? label1 ---------------------------
procedure TForm3.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  label1.TextSettings.FontColor:=TAlphaColorrec.Mediumblue;
end;
//????????? ??????--------------------------------------------------------------
procedure TForm3.TabControl1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  i:=tabcontrol1.TabIndex;

  if image3.Enabled=true then
  begin
     if EventInfo.GestureID=1 then
    begin
      image3.Visible:=false;
      image1.Enabled:=true;
      image3.Enabled:=false;
      button25.Text:='?????????? ???????';
    end;

    if EventInfo.GestureID=2 then
    begin
      image3.Visible:=false;
      image3.Enabled:=false;
      image1.Enabled:=true;
      button25.Text:='?????????? ???????';
    end;

    if EventInfo.GestureID=3 then
    begin
      image3.Visible:=false;
      image3.Enabled:=false;
     image1.Enabled:=true;
      button25.Text:='?????????? ???????';
    end;

  end
  else
  begin
    if EventInfo.GestureID=1 then
    begin
      if i=0 then tabcontrol1.SetActiveTabWithTransition(Tabitem2 ,TTabTransition.Slide, TTabTransitionDirection.Normal);
      if i=1 then tabcontrol1.SetActiveTabWithTransition(Tabitem3 ,TTabTransition.Slide, TTabTransitionDirection.Normal);
      if i=2 then  tabcontrol1.SetActiveTabWithTransition(Tabitem1 ,TTabTransition.Slide, TTabTransitionDirection.Normal);
    end;

    if EventInfo.GestureID=2 then
    begin
      if i=0 then tabcontrol1.SetActiveTabWithTransition(Tabitem3 ,TTabTransition.Slide, TTabTransitionDirection.Reversed);
      if i=1 then tabcontrol1.SetActiveTabWithTransition(Tabitem1 ,TTabTransition.Slide, TTabTransitionDirection.Reversed);
      if i=2 then tabcontrol1.SetActiveTabWithTransition(Tabitem2 ,TTabTransition.Slide, TTabTransitionDirection.Reversed);
    end;

    if EventInfo.GestureID=3 then
    begin
      application.Terminate;
    end;

  end;
end;
// ?????? (-/+) ----------------------------------------------------------------
procedure TForm3.Button1Click(Sender: TObject);
var
  i: integer;
begin
  s:=memo1.Lines[memo1.Lines.Count-1];
  // ????????? -----------------------------------------------------------------
  if pos('exp', s)<>0 then
  begin
    if pos('(-j', s)=0 then
    begin
      i:=pos('(',s)+1;
      Insert('-',s,i);
    end
  else
    delete(s,pos('(',s)+1,1);
  end;

  if   (pos('exp', s)=0) and  (pos('j', s)<>0) then
  begin
    if pos('-j', s)=0 then
    begin
      i:=pos('+j',s);
      delete(s,i,1);
      Insert('-',s,i);
    end
    else
    begin
      i:=pos('-j',s);
      delete(s,i,1);
      Insert('+',s,i);
    end;
  end;

  if (pos('exp', s)=0) and (pos('j', s)=0) then
  begin
    if pos('-', s)=0 then
    begin
      Insert('-',s,1);
    end
  else
    delete(s,1,1);
  end;

  memo1.Lines[memo1.Lines.Count-1]:=s;

end;
// ?????? (+) ------------------------------------------------------------------
procedure TForm3.Button20Click(Sender: TObject);
begin
  if length(Rezultat)>0 then
  begin
    sbros;
    memo1.Lines[memo1.Lines.Count-1]:=Rezultat;
  end;

  s:=memo1.Lines[memo1.Lines.Count-1];

  vyhod:=false;
  PROCESSING(s,s,vyhod);
  if vyhod=true then  exit;

  if memo1.Lines.Count>2 then  exit;
  memo1.Lines[memo1.Lines.Count-1]:=s;
  memo1.lines.Add('+');
  memo1.lines.Add(' ');
  memo1.Lines[memo1.Lines.Count-1]:='';
   s:='';

end;
// ?????? (-) ------------------------------------------------------------------
procedure TForm3.Button12Click(Sender: TObject);
begin
  if length(Rezultat)>0 then
  begin
    sbros;
    memo1.Lines[memo1.Lines.Count-1]:=Rezultat;
  end;

  s:=memo1.Lines[memo1.Lines.Count-1];

  vyhod:=false;
  PROCESSING(s,s,vyhod);
  if vyhod=true then  exit;

  if memo1.Lines.Count>2 then  exit;
  memo1.Lines[memo1.Lines.Count-1]:=s;
  memo1.lines.Add('-');
  memo1.lines.Add(' ');
  memo1.Lines[memo1.Lines.Count-1]:='';
  s:='';
end;
// ?????? (*) ------------------------------------------------------------------
procedure TForm3.Button16Click(Sender: TObject);
begin
  if length(Rezultat)>0 then
  begin
    sbros;
    memo1.Lines[memo1.Lines.Count-1]:=Rezultat;
  end;
  s:=memo1.Lines[memo1.Lines.Count-1];

  vyhod:=false;
  PROCESSING(s,s,vyhod);
  if vyhod=true then  exit;

  if memo1.Lines.Count>2 then  exit;
  memo1.Lines[memo1.Lines.Count-1]:=s;
  memo1.lines.Add('*');
  memo1.lines.Add(' ');
  memo1.Lines[memo1.Lines.Count-1]:='';
  s:='';
end;
// ?????? (/) ------------------------------------------------------------------
procedure TForm3.Button8Click(Sender: TObject);
begin
  if length(Rezultat)>0 then
  begin
    sbros;
    memo1.Lines[memo1.Lines.Count-1]:=Rezultat;
  end;

  s:=memo1.Lines[memo1.Lines.Count-1];

  vyhod:=false;
  PROCESSING(s,s,vyhod);
  if vyhod=true then  exit;

  if memo1.Lines.Count>2 then  exit;
   memo1.Lines[memo1.Lines.Count-1]:=s;
  memo1.lines.Add('/');
  memo1.lines.Add(' ');
  memo1.Lines[memo1.Lines.Count-1]:='';
  s:='';
end;
// ?????? (=) ------------------------------------------------------------------
procedure TForm3.Button4Click(Sender: TObject);
var
  i:integer;
begin
  s:=memo1.Lines[memo1.Lines.Count-1];

  vyhod:=false;
  PROCESSING(s,s,vyhod);
  if vyhod=true then  exit;

  memo1.Lines[memo1.Lines.Count-1]:=s;
  SetLength(Stroka, memo1.lines.Count);
  // ?????????? ??????? Stroka ??? ????????? ? SOLVER---------------------------
  for i := 0 to Length(Stroka)-1 do
  begin
    Stroka[i]:= memo1.Lines[i];
    if Length(Stroka[i])=0 then
    begin
      ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ????????.');
      exit;
    end;

  end;

  if  (stroka[length(stroka)-1]=' ') then
   begin
     ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ????????.');
     exit;
   end;

  if (length(stroka)=1) then exit;
  //////////////////////////////////////////////////////////////////////////////
  // ????? ????????? SOLVER ----------------------------------------------------
  SOLVER(Stroka, Res, Ims );
  //////////////////////////////////////////////////////////////////////////////
  //????? ????? ????? ----------------------------------------------------------
  memo1.lines.Add('=');
  // ???????? ? ??????? (-/+) ????? (j) ??? ?????? (Im) ??? (Re=0) -------------
  if (Res=0) and (Ims<>0) then
  begin
    if Ims<0 then
    begin
      Ims:=-1*Ims;
      memo1.lines.Add('-j'+VYVOD(Ims));
    end
    else
    begin
       memo1.lines.Add('+j'+VYVOD(Ims));
    end;
  end
  else
  // ????? Re ??? (Im=0) -------------------------------------------------------
  begin
    if Ims=0 then  memo1.lines.Add(VYVOD(Res))
    else
    // ???????? ? ??????? (-/+) ????? (j) ??? ?????? ?????? --------------------
    begin
      if Ims<0 then
      begin
        Ims:=-1*Ims;
        memo1.lines.Add(VYVOD(Res)+'-j'+VYVOD(Ims));
      end
      else
      begin
         memo1.lines.Add(VYVOD(Res)+'+j'+VYVOD(Ims));
      end;
    end;
  end;

  Rezultat:=memo1.Lines[memo1.Lines.Count-1];

end;
// ?????? (MEMORY) -------------------------------------------------------------
procedure TForm3.Button22Click(Sender: TObject);
begin
 if mem=false then
  begin

    mem:=true;
    button22.text:='MEMORY-';
    if memo1.lines.Count=1 then
    begin
      Memory:= memo1.Lines[memo1.Lines.Count-1];
      if (Memory='+') or  (Memory='-') or (Memory='*') or (Memory='/') or (Memory='') then
      begin
        ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ????????.');
        button22.text:='MEMORY+';
        mem:=false;
        exit;
      end;
    end
    else
    begin
      Memory:= memo1.Lines[memo1.Lines.Count-1];
      if (Memory='+') or  (Memory='-') or (Memory='*') or (Memory='/') or (Memory='') then
      begin
        ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ????????.');
        button22.Text:='MEMORY+';
         mem:=false;
        exit;
      end;
    end;
  end
  else
  begin
    if mem=true then memo1.Lines[memo1.Lines.Count-1]:=memory;
    button22.Text:='MEMORY+';
    memory:='';
    mem:=false;
   end;
end;
// ?????? (BACK) ---------------------------------------------------------------
procedure TForm3.Button23Click(Sender: TObject);
var
  dlina: integer;
begin

  s:= memo1.Lines[memo1.Lines.Count-1];

  dlina:=Length(s);
  delete(s,dlina,1);

  if pos('exp', s)=0 then  exp:=false;
  if pos('+j' , s)=0 then  alg:=false;

  memo1.Lines[memo1.Lines.Count-1]:=s;
  if (length(s)=0) and (memo1.Lines.Count-1>0) then
  begin
    memo1.Lines.Delete(memo1.Lines.Count-1);
   end;
end;
// ?????? (AXP/ALG) ------------------------------------------------------------
procedure TForm3.Button21Click(Sender: TObject);
var
  Mdl2, psi2, Re2, Im2: extended;
  a1, b1 : string;
  i, j:integer;

begin
  s:=memo1.Lines[memo1.Lines.Count-1];

  vyhod:=false;
  PROCESSING(s,s, vyhod);
  if vyhod=true then  exit;

  // ??????? ?????????? ?????????? /////////////////////////////////////////////
  if pos('exp', s)<>0 then
  begin

    i:=pos('exp', s)-1;
    a1:=copy(s,1,i) ;
    // ????  ???????? ????????????? --------------------------------------------
    if pos('-j', s)=0 then
    begin
      j:=pos('j', s)+1;
      b1:=copy(s,j,Length(s)-j) ;
    end;
    if pos('-j', s)<>0 then
    begin
      j:=pos('j', s)+1;
      b1:='-'+copy(s,j,Length(s)-j) ;
    end;

    // ????? ????????? ???????? exp ---------------------------------------------
    EXPTOALG(StrToFloat(a1),StrToFloat(b1),Re2,Im2);
    //---------------------------------------------------------------------------
    //memo1.CaretPos.SetLocation(0, memo1.CaretPos.y);
    // ????   ?????? ????? ????????????? ----------------------------------------
    if (Re2=0) and (Im2<>0) then
    begin
      if Im2<0 then
      begin
        Im2:=-1*Im2;
        memo1.Lines[memo1.Lines.Count-1]:='-j'+VYVOD(Im2);
      end
      else
      begin
        memo1.Lines[memo1.Lines.Count-1]:='+j'+VYVOD(Im2);
      end;
    end
    else
    // ????? Re ??? (Im=0) -------------------------------------------------------
    begin
      if Im2=0 then  memo1.Lines[memo1.Lines.Count-1]:=VYVOD(Re2)
      else
      // ???????? ? ??????? (-/+) ????? (j) ??? ?????? ?????? --------------------
      begin
        if Im2<0 then
        begin
          Im2:=-1*Im2;
          memo1.Lines[memo1.Lines.Count-1]:=VYVOD(Re2)+'-j'+VYVOD(Im2);
        end
        else
        begin
          memo1.Lines[memo1.Lines.Count-1]:=VYVOD(Re2)+'+j'+VYVOD(Im2);
        end;
      end;
    end;

  end;

  // ??????? ?????????? ?????????????? /////////////////////////////////////////
  if ((pos('j', s))<>0)  and (pos('exp', s)=0) then
  begin
    //??????? (1) ????? (j) ---------------------------------------------------
    if pos('j', s)=Length(s) then  s:=s+'1';
       // ????????? ?????????????? ????? ------------------------------------------
       i:=pos('j', s)-2;
       if (pos('+j', s)=1) or (pos('-j', s)=1)  then  a1:='0'  else  a1:=copy(s,1,i) ;
       // ????????? ?????? ????? --------------------------------------------------
       j:=pos('j', s)+1;
       b1:=copy(s,j,Length(s)-j+1) ;

       Re2:=StrToFloat(a1);
       Im2:=StrToFloat(b1);

       if pos('-j', s)<>0 then Im2:=Im2*(-1);

       ALGTOEXP(Re2,Im2,Mdl2,psi2);

      //memo1.CaretPos.SetLocation(0,memo1.CaretPos.y);
       if psi2<0 then
       begin
         psi2:=-1*psi2;
         memo1.Lines[memo1.Lines.Count-1]:=(VYVOD(Mdl2)+'exp(-j'+VYVOD(psi2)+')');
       end
       else memo1.Lines[memo1.Lines.Count-1]:=(VYVOD(Mdl2)+'exp(j'+VYVOD(psi2)+')');
     end;


end;
// ?????? (EXP) ----------------------------------------------------------------
procedure TForm3.Button17Click(Sender: TObject);
begin
  s:=memo1.Lines[memo1.Lines.Count-1];
  if pos('j', s)<>0 then
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'???????? ???????? ??????????!');
    exit;
  end;

  if pos('exp', s)<>0 then
  ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ???? ??????????!' )
  else s:=s+'exp(j';
  memo1.Lines[memo1.Lines.Count-1]:=s;
end;
// ?????? (ALG) ----------------------------------------------------------------
procedure TForm3.Button18Click(Sender: TObject);
begin
s:=memo1.Lines[memo1.Lines.Count-1];

  if pos('exp', s)<>0 then
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'???????? ???????? ?????? ?????!');
    exit;
  end;

   if pos('j', s)<>0 then
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ???? ?????? ??????? (j)!');
    exit;
  end;

  if (pos('-', s)=1) and ((pos('-', s)=length(s))) then
  begin
    s:=s+'j';
    memo1.Lines[memo1.Lines.Count-1]:=s;
    exit;
  end
  else
   begin
     if pos('j', s)<>0 then
     begin
       ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'??????? ???? ?????? ??????? (j)!');
       exit;
     end
      else s:=s+'+j';

  end;

  memo1.Lines[memo1.Lines.Count-1]:=s;
end;
// ?????? (SQRT) ---------------------------------------------------------------
procedure TForm3.Button19Click(Sender: TObject);
var
  A: extended;
begin
  s:= memo1.Lines[memo1.Lines.Count-1];
  memo1.ClearContent;
  if (pos('exp', s)=0) and (pos('j', s)=0) and (pos('+', s)=0)
  and (pos('*', s)=0) and (pos('/', s)=0) and (length(s)<>0) then
  begin
    if StrToFloat(s)<0 then
    begin
      A:=sqrt(-1*StrToFloat(s));
      memo1.Lines[memo1.Lines.Count-1]:='+j'+VYVOD(A);
      exit;
    end;
    A:=sqrt(StrToFloat(s));
    memo1.Lines[memo1.Lines.Count-1]:=VYVOD(A);
  end
   else
  begin
    ShowMessage('??! ?????? ??? ??????.' +#10+#13 +'???????? ???????? ??????????? ?????!');
     s:='';
    exit;
   end;

end;
//????????? ??????? ?????? (0-9 ? ,) -------------------------------------------
procedure TForm3.CifButtonClick(Sender: TObject);
begin
   S:=S+(Sender as TButton).Text;
  memo1.Lines[memo1.Lines.Count-1]:=S;
end;
// ?????? (C) ------------------------------------------------------------------
procedure TForm3.Button24Click(Sender: TObject);
begin
  sbros;
  Rezultat:='';
end;
// ?????? (?????????? ???????) -------------------------------------------------
procedure TForm3.Button25Click(Sender: TObject);
begin
  if image3.Visible=false then
  begin
   button25.Text:='???????';
   image3.Visible:=true;
   image3.Enabled:=true;
   image1.Enabled:=false;

  end
  else
  begin
    button25.Text:='?????????? ???????';
    image3.Visible:=false;
    image3.Enabled:=false;
    image1.Enabled:=true;
  end;
end;
// ?????? (,) ------------------------------------------------------------------
procedure TForm3.Button3Click(Sender: TObject);
begin
  s:=memo1.Lines[memo1.Lines.Count-1];
  if pos(',', S)>1 then exit;
  S:=S+',';
  if pos(',', S)=1 then insert('0', S, 1);
  memo1.Lines[memo1.Lines.Count-1]:=S;
end;
// ????? ???? ??????????--------------------------------------------------------
procedure TForm3.Sbros;
begin
  s:='';
  memo1.Lines.Clear;
  memo1.Lines.Add('');
  stroka:=nil;
  Res:=0;
  Ims:=0;
end;

end.
