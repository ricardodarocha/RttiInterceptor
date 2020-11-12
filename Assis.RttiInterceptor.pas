unit Assis.RttiInterceptor;

interface

uses
  System.Rtti, System.SysUtils;

type

  TRttiInterceptor<T: Class> = class
    class procedure MapField(var AClass: T; aProc: TProc<TRttiField> );
    class procedure MapProperty(var AClass: T; aProc: TProc<TRttiProperty> );
  end;

implementation


class procedure TRttiInterceptor<T>.MapField(var AClass: T; aProc: TProc<TRttiField>);
var
  ctx: TRttiContext;
  ty: TRttiType;
  prop: TRttiProperty;
  fi: TRttiField;

begin

  {exemplo de aProc
          fi.SetValue(Pointer(fObject), TValue.From(fFdQuery.FieldByName(fi.Name).Value));}

  ctx := TRttiContext.Create;
  ty := ctx.GetType(T.ClassInfo);

  try
    for fi in ty.GetFields do
    begin
        try
          aProc(Fi);
        finally

        end;
    end;

  finally
     ctx.Free;
  end;
end;

class procedure TRttiInterceptor<T>.MapProperty(var AClass: T; aProc: TProc<TRttiProperty>);
var

  ctx: TRttiContext;
  ty: TRttiType;
  prop: TRttiProperty;
  fi: TRttiField;

begin
  {Exemplo de aproc
      //  if not Prop.IsWritable then
      //  continue;
      //  Prop.Name +' TYPE#'+ Prop.PropertyType.Name + ','#13
      //  prop.SetValue(Pointer(fObject), TValue.From(fFdQuery.FieldByName(prop.Name).Value));
      }

  ctx := TRttiContext.Create;
  ty := ctx.GetType(T.ClassInfo);

  try
    for prop in ty.GetProperties do
    begin

      try
        aProc(prop);
      finally

      end;
    end;

  finally
    ctx.Free;
  end;
end;

end.
