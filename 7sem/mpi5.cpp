// ������� 3. min(Sum(aik*bkj)) (� ��������� ��������)
#include <stdio.h>
#include <mpi.h>
#include <time.h>
#include <stdlib.h>
#include <string>

#define dimension 1//����������� ���������� �������

//���������� ������������� ������������ ��������������� ��������� �����
int calc_sum(int *a,int *b, int len)
{
	int sum = 0;
	for (int i=0;i<len;i++)
		sum+=a[i]*b[i];
	return sum;
}

int main(int argc,char *argv[])
{
	int i,j,n,rank,rank_pred,rank_next,min,current;
	int dims[dimension],periods[dimension],new_coords[dimension];
	MPI_Comm new_comm;
	MPI_Status st;

	MPI_Init(&argc,&argv);
	MPI_Comm_size(MPI_COMM_WORLD, &n);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	//�������� ������ dims � ��������� ������ periods ��� ��������� "������" 
	for(i=0; i<dimension; i++)
	{
		dims[i]=0;
		periods[i]=1;
	}
	MPI_Dims_create(n, dimension, dims); 
	MPI_Cart_create (MPI_COMM_WORLD, dimension, dims, periods, 0, &new_comm);
	MPI_Cart_coords (new_comm, rank, dimension, new_coords);
	MPI_Cart_shift(new_comm, 0, -1, &rank_pred, &rank_next);

	int *A,*B;
	A = (int *) ( malloc(sizeof(int)*n) ); // ������ ������ = n
	B = (int *) ( malloc(sizeof(int)*n) ); // ������ �������� = n
	char str[300]="A[";
	char buf[5];
	itoa(rank,buf,10);
	strncat(str,buf,strlen(buf));
	strncat(str,"] = [",5);
	//���������� ������  �
	srand(time(NULL)+rank);	
	for (i=0;i<n;i++)
	{
		A[i]=rand()%10;
		itoa(A[i],buf,10);
		strncat(str,buf,strlen(buf));
		strncat(str,", ",2);
	}
	strncat(str,"]\nB[",5);
	itoa(rank,buf,10);
	strncat(str,buf,strlen(buf));
	strncat(str,"] = [",5);
	//���������� ������� B
	for (i=0;i<n;i++)
	{
		B[i]=rand()%10;
		itoa(B[i],buf,10);
		strncat(str,buf,strlen(buf));
		strncat(str,"  ",2);
	}
	strncat(str,"]\nResults:\n   sum(A[",22);
	itoa(rank,buf,10);
	strncat(str,buf,strlen(buf));
	strncat(str,",k]*B[k,0]) = ",14);
	current=calc_sum(A,B,n);	// ���������� ����� ������������ ��������� ��� �������������� �����,
	min=current;				// ������ �� ������� �������
	itoa(current,buf,10);
	strncat(str,buf,strlen(buf));
	strncat(str,"\n",2);
	for (j=1;j<n;j++) // ������ ��� ��������� �������� ������� �
	{
		MPI_Sendrecv_replace(B,n,MPI_INT,rank_next,2,rank_pred,2,new_comm,&st); //��������� � ��������� ������ ������� �
		current=calc_sum(A,B,n); // ���������� ����� ������������
		if (current<min) min=current; // ���������� ��������
		// ������ sum(A[i,k]*B[k,j]) = current
		strncat(str,"   sum(A[",9);
		itoa(rank,buf,10);
		strncat(str,buf,strlen(buf));
		strncat(str,",k]*B[k,",8);
		itoa(j,buf,10);
		strncat(str,buf,strlen(buf));
		strncat(str,"]) = ",5);
		itoa(current,buf,10);
		strncat(str,buf,strlen(buf));
		strncat(str,"\n",2);				   
	}
	// ������ ����������
	strncat(str," Minimum = ",11);
	itoa(min,buf,10);
	strncat(str,buf,strlen(buf));
	strncat(str,"\n",2);
	printf("%s\n",str);

	MPI_Comm_free(&new_comm) ;
	free(A);
	free(B);
	MPI_Finalize();
	return 0;
}
