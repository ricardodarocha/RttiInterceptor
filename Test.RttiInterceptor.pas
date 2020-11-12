unit Test.RttiInterceptor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

TOrder = class
  private
    function GetDiscountValue: Currency;
  public
  FID: String;
  FVENDOR: Integer;
  FCUSTOMER: Integer;
  FDATE: TDatetime;
  FTOTAL: Currency;
  FDiscount: double; //a tax of discount
  published
  property DiscountValue: Currency read getDiscountValue;
end;

  TOrderFactory = class
    class function NewOrder(aId: String; aVendor, aCustomer: Integer; aTotal: Currency): TOrder;
    class function ApplyDiscount(var aOrder: TOrder; aTax: Double): TOrder;
  end;

  TformTestRttiInterceptor = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTestRttiInterceptor: TformTestRttiInterceptor;

implementation

  uses System.Rtti, Assis.RttiInterceptor;

{$R *.dfm}


{ TOrderFactory }

class function TOrderFactory.NewOrder(aId: String; aVendor, aCustomer: Integer; aTotal: Currency): TOrder;
begin
  Result := TOrder.Create;
  with result do
  begin
    FId := aId;
    FVendor := aVendor;
    FCustomer := aCustomer;
    FTotal := aTotal;
    FDiscount := 0;
    FDATE := now;
  end;
end;

class function TOrderFactory.ApplyDiscount(var aOrder: TOrder; aTax: Double): TOrder;
begin
  aOrder.FDiscount := aTax;
  Result := aOrder;
end;

function TOrder.GetDiscountValue: Currency;
begin
  result := FTotal * FDiscount;
end;

procedure TformTestRttiInterceptor.Button1Click(Sender: TObject);
var Order: TOrder;
begin
  Order := TOrderFactory.NewOrder('DFA1703C-11EA',1,1,99.99);
  TOrderFactory.ApplyDiscount(Order, 0.05);
  Memo1.Clear;
  TRttiInterceptor<TOrder>.MapField(Order, procedure (aField: TRttiField)
     begin
       Memo1.lines.Add('Field ' + aField.Name + ' = ' + aField.GetValue(Order).ToString);
     end);

  TRttiInterceptor<TOrder>.MapProperty(Order, procedure (aProperty: TRttiProperty)
     begin
       Memo1.lines.Add('Property ' + aProperty.Name + ' = ' + aProperty.GetValue(Order).ToString);
     end);
  FreeAndNil(Order);

end;

end.
