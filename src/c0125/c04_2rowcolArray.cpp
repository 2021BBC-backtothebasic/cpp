#include <iostream>
using namespace std;

int main()
{
    int row = 3, col = 5;
    
    int* row_1 = new int[col]{1,2,3,4,5};
    int* row_2 = new int[col]{6,7,8,9,10};
    int* row_3 = new int[col]{11,12,13,14,15};
    
    int ** twod_array = new int*[row]{row_1, row_2, row_3};
    
    for(int i = 0; i< row; i++)
    {
        for(int j=0; j< col; j++)
        {
            cout << "a[" << i << "][" << j << "] : " << twod_array[i][j] << endl;
        }
    }
    
    
    delete[] row_1;//** 항상 순서대로 해줘야한다. ***
    delete[] row_2;
    delete[] row_3;
    delete[] twod_array;
    
        
    return 0 ;
}
