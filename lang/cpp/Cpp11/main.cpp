//**********************************************************************
//! @file   main.cpp
//! @brief  describe
//! @author d_nishimura
//**********************************************************************
#include <iostream>
#include <vector>
#include "Utility.h"

template <size_t N, typename DataType>
struct HogeClass
{
    typedef typename static_if<N==1, DataType, std::vector<DataType> >::type type;
};


int main(int argc, char* argv[])
{
    std::vector<int> hoge;
    HogeClass<1, int>::type Single;
    HogeClass<2, int>::type Double;

    std::cout << "Hello. :" << GetSize(Single) << std::endl;
    std::cout << "Hello. :" << GetSize(Double) << std::endl;

    return 0;
}

