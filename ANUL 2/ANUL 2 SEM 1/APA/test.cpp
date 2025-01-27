#include <iostream>

using namespace std;

class Matrix
{
public:
	int Tab[50][50];
	int line;
	int column;

public:
	Matrix();
	Matrix(int);
	Matrix(int, int);
	Matrix(const Matrix&);
	~Matrix();

	void f_set_matr();
	void f_show();
	void f_addition(const Matrix &matrix);
	void f_subtract(const Matrix &matrix);
	void f_multipl_matrix(const Matrix &matrix);
	void f_multipl_num(int value);
};

int g_size;

Matrix::Matrix() : line(0), column(0) {}

Matrix::Matrix(int line, int column) : line(line), column(column)
{
	int i, j;

	if ((line >= 0) && (column >= 0))
	{
		for (i = 0; i < line; i++)
			for (j = 0; j < column; j++)
				Tab[i][j] = 0;
	}
	else
		cout << "Error. Matrix are not positive !!" << endl;
}

Matrix::Matrix(const Matrix& Tab2) : line(Tab2.line), column(Tab2.column)
{
	int i, j;
	for (i = 0; i < line; i++)
		for (j = 0; j < column; j++)
			Tab[i][j] = Tab2.Tab[i][j];
}

Matrix::~Matrix()
{
	int i;

	for(i = 0; i < line; ++i) 
		delete [] Tab;
	line = 0;
	column = 0;
}

void	Matrix::f_set_matr()
{
	int i, j;
	for (i = 0; i < line; i++)
		for (j = 0; j < column; j++)
		{
			cout << " Matrix["<<i<<"]["<<j<<"]=";
			cin >>Tab[i][j];
		}
}

void	Matrix::f_show()
{
	int i, j;

	for (i = 0; i < line; i++)
	{
		for (j = 0; j < column; j ++)
			cout << "\t" << Tab[i][j] << "\t";
		cout << endl;
	}
}

void	Matrix::f_addition(const Matrix &matrix)
{
	Matrix matr;
	int i, j;

	if ((line == matrix.line) && (column == matrix.column))
	{
		for (i = 0; i < line; i++)
			for (j = 0; j < column; j ++)
				Tab[i][j] += matrix.Tab[i][j];
	}
	else
		cout << "The dimensions do not match !!" << endl;
}

void	Matrix::f_subtract(const Matrix &matrix)
{
	int i, j;

	if ((line == matrix.line) && (column == matrix.column))
	{
		for (i = 0; i < line; i++)
			for (j = 0; j < column; j ++)
				Tab[i][j] -= matrix.Tab[i][j];
	}
	else
		cout << "The dimensions do not match !!" << endl;
}

void	Matrix::f_multipl_matrix(const Matrix &matrix)
{
	int i, j, k;
	int temp = 0;
	int Tab2[50][50];

	if (column == matrix.line)
	{
		for (i = 0; i < line; i++)
		{
			for (j = 0; j < column; j ++)
			{
				for (k = 0; k < line; k++)
				{
					temp += Tab[i][k] * matrix.Tab[k][j];
					Tab2[i][j] = temp;
				}
				temp = 0;
			}
			temp = 0;
		}
		for (i = 0; i < line; i++)		
			for (j = 0; j < column; j ++)
				Tab[i][j] = Tab2[i][j];
	}
	else
		cout << "The matrix are not compatible for multiplying !!" << endl;
}

void	Matrix::f_multipl_num(int value)
{
	int i, j;

	for (i = 0; i < line; i++)
		for (j = 0; j < column; j ++)
			Tab[i][j] *= value;
}

void	f_menu()
{
	Matrix m1, m2;
	int ml_nr;

	cout << "\tInput first matrix !!\n" << endl;
	cout << "**Lines =   ";
	cin >> m1.line;
	cout << "**Columns =  ";
	cin >> m1.column;
	Matrix matrix1(m1.line, m1.column);
	matrix1.f_set_matr();
		system ("pause");
		system ("cls");
	
	cout << "\tInput second matrix !!\n" << endl;
	cout << "**Lines =   ";
	cin >> m2.line;
	cout << "**Columns =  ";
	cin >> m2.column;
	Matrix matrix2(m2.line, m2.column);
	matrix2.f_set_matr();
		system ("pause");
		system ("cls");

	cout << "***First Matrix:" << endl;
	matrix1.f_show();		
	cout << "\n***Second Matrix:" << endl;
	matrix2.f_show();

	Matrix matrix3 = matrix1;
	Matrix matrix4 = matrix1;
	Matrix matrix5 = matrix1;

	cout << "\n***Matrix addition:" << endl;
	matrix1.f_addition(matrix2);
	matrix1.f_show();

	cout << "\n***Matrix subtraction: (matrix1 - matrix2)" << endl;
	matrix4.f_subtract(matrix2);
	matrix4.f_show();
	
	cout << "\n***Matrix multiplication:\n" << endl;
	matrix5.f_multipl_matrix(matrix2);
	matrix5.f_show();

	cout << "\n***Multiply first matrix with number"<< endl;
	cout << "**Imput number >>>   ";
	cin >> ml_nr;
	cout << endl;
	matrix3.f_multipl_num(ml_nr);
	matrix3.f_show();

	system("pause");
	exit(0);
}

int		main()
{
	f_menu();
	return (0);
}
