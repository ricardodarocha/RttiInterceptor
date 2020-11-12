# Rtti Interceptor
A Rtti facilitator to access fields and properties of an object

# Declare a Type

```delphi
TOrder = class
  FID: String;
  FVENDOR: Integer;
  FCUSTOMER: Integer;
  FDATE: TDatetime;
  FTOTAL: Currency;
  FDiscount: double; //a tax of discount
property DiscountValue: Currency;
end;
```
# Prepare to use TRttiInterceptor

```delphi
uses System.Rtti, Assis.RttiInterceptor;
```

# Extract rtti info

Perform TRttiInterceptor to map fields and properties for TOrder

```delphi
button1Click(Sender: TObject);
var Order: TOrder;
begin
  Order := ...{Make order using a factory}
  Memo1.Clear;
  TRttiInterceptor<TOrder>.MapField(Order, procedure (aField: TRttiField)
     begin
       Memo1.lines.Add('Field :' + aField.Name);
     end);  

  TRttiInterceptor<TOrder>.MapProperty(Order, procedure (aProperty: TRttiProperty)
     begin
       Memo1.lines.Add('Property :' + aProperty.Name);
     end);
);
end;
```
