unit UMemory;

interface
  uses SysUtils, UDetail;
  type
    Tgeneration=(DDR2, DDR3, DDR4);
      Memory = class(Detail)
      private
        size:integer;
        Fgeneration:Tgeneration;
      public
        constructor Create(indenf,pr, n:integer; gen:Tgeneration);
        destructor Destroy; override;
        function getSize:integer;
        procedure setSize(n:integer);
        property generation:Tgeneration read Fgeneration write Fgeneration;
        function toString:String; override;
    end;


implementation
  constructor Memory.Create(indenf, pr, n:integer; gen:Tgeneration);
  begin
    inherited Create(indenf, pr);
    size := n;
    generation := gen;
  end;

  destructor Memory.Destroy;
  begin
    inherited Destroy;
  end;

  function Memory.toString:string;
  begin
    result :='Оперативная память ';
    result := inherited toString;
    result := result + ' Размер: ' + IntToStr(size);
    case Fgeneration of
      DDR2: result := result + ' Поколение: DDR2 ';
      DDR3: result := result + ' Поколение: DDR3 ';
      DDR4: result := result + ' Поколение: DDR4 ';
    end;
  end;

  //получить размер памяти
  function Memory.getSize:integer;
  begin
   result := size;
  end;

  //установить размер
  procedure Memory.setSize(n:integer);
  begin
    size := n;
  end;
end.
