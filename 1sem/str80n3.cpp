//����� ���� ������������ ����� �1,�2,...,a2n. ��� ����� ���������� n ���������� �������� ���(a1,a2),(a3,a4),...,(a2n-1,a2n).
//������� �� ����� �������� ���, ������������� �� ������� ���� ���� �����-������ �� ������ ����������? ���� ��, �� ������� ����� �� ���� �����;
//��������� ����������� �����, 61 ������;
#include "iostream"
#include "windows.h"

using namespace std;

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);

	unsigned int n;
	cout << "������� ���������� ����������:\n";
	cin >> n;														

	float*x = new float[n];	//������ ���������;										
	float*y = new float[n];	//����� ���������;										

	for (int i = 0; i < n; i++)				
	{
		cout << "������� " << i+1 << " ��������:\n"; //���� ����������;				
		cin >> x[i] >> y[i];
	}

	float a, b, c;
	for (int i = 0; i < n - 1; i++)	//��������� ��������� �� ����������� �� ��������� �����;								
	{
		if (x[i + 1] < x[i])
		{
			a = x[i + 1];
			b = y[i + 1];
		
			x[i + 1] = x[i];
			y[i + 1] = y[i];
		
			x[i] = a;
			y[i] = b;
		
		}
	}

	int minY, maxX, E4 = 0, err = 0; //����� � ������ ������� ����� �����, ��������� �� ������;								
	for (int i = 0; i < n - 2; i++)
	{
		if (x[i + 1] < y[i])
		{
			if (y[i] < y[i + 1]) minY = y[i]; //������� ������� ����� �����;						
			else minY = y[i + 1];

			if (x[i + 2] < y[i + 1]) maxX = x[i + 2];
			if (y[i + 2] < minY) minY = y[i + 2];
		}
		else E4++;

		if (E4 == 0)												
		{
			cout << "���� ����� �����: " << (minY + maxX) / 2 + 0.0001<< endl; //������� ����� �����;
		}
		else
		{
			E4 = 0;
			err++;
		}
	}

	if (err == n-2) cout << "��� ����� �����\n";					
	system("pause");
    return 0;
}

