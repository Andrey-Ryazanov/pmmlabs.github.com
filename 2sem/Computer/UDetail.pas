unit UDetail;
{10. Задан некоторый родительский класс. От него должно быть определено
несколько потомков. Определить класс Список элементов, который может
одновременно содержать разных потомков базового класса. Реализовать
операции добавления элемента в список, удаление элемента из списка, поиск
элемента в списке и другие. Решить задачи.
«Детали компьютера».

Любая деталь компьютера, хранимая на складе,
имеет идентификационный номер – целое число. Детали бывают
разными, например, память, процессор, монитор и т.д. Как следствие,
детали обладают разными характеристиками. На складе имеются
различные детали, для каждой из которой известно количество в штуках
и цена. Предложить покупателю разные варианты нужной ему детали с
заданными характеристиками на определенную сумму.}
interface
  uses SysUtils;
  type
    Detail = class
      private
        id:integer;
        price:integer;
      public
        constructor Create(indenf:integer; pr:integer);
        destructor destroy; override;
        procedure setId(iden:integer);
        procedure setPrice(p:integer);
        function getId:integer;
        function getPrice:integer;
        function toString:String;virtual;
    end;

implementation
  constructor Detail.Create(indenf:integer; pr:integer);
  begin
    inherited Create;
    id := indenf;
    price := pr;
  end;

  destructor Detail.destroy;
  begin
    inherited destroy;
  end;

  function Detail.toString:String;
  begin
    result := result + 'id: '+ IntToStr(id) + ' price: '+ IntToStr(price);
  end;
  procedure Detail.setId(iden:integer);
  begin
    id := iden;
  end;

  procedure Detail.setPrice(p:integer);
  begin
    price := p;
  end;

  function Detail.getId:integer;
  begin
    result := id;
  end;

  function Detail.getPrice:integer;
  begin
    result := price;
  end;
end.

