//�������� ������������,������������ ���� �� � ������ ���� �� ��� ���������� ��������(������������ ��������� ������)
#include <iostream>
using namespace std;

struct list
{
     int d;
     list *next;
};

list *create(list **end, const int a); //�������� �������� ������
void search(list *end, list *l); //�����

int main() 
{
    int a, n;
    cout<<" "<<"IMPUT N: ";
    cin>>n;
    cout<<"\n";
    cin>>a;
    list *l = new list;
    list *end=l;
    int d;
    l->d=a; //����������� � ���������� d, ����������� � ������, ����� ������� ���������� � ��������� l.
    for (int i=1; i<n; i++)
    {
        cin>>a;
        end=create(&end, a);
    }
    search(end, l);
    cout <<"\n";
    system("pause");
return 0;
}

list *create(list **end, const int a) //** ����� �������� ��������� ��������
{
     int d;
     list *l = new list;
     l->d=a; //������� �������
     l->next=0; //���������� ���
     (*end)->next=l; //� ���������� ��������� �� �������
     *end = l; //��������� �� �����
     return (*end);
}

void search(list *end, list *l)
{
     list *head=l; // ��������� �� ������ �������
     list * f = l;
     list * h = l;
     bool r = false;
     while ((l)&&(r==false))
     {
           
           while ((f)&&(r==false)) //���� �� ����� ������
           {        
              if ((l->d==f->d)&&(f!=l)) //����� ����������
                    r = true;
              f = f->next; //��� �����
           }
           l = l->next;
           f = h;
           
     }
     if (r == true)
     cout<<"est' odinakowie";
     else
     cout<<"net odinakowih";
}