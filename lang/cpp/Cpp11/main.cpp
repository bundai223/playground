//**********************************************************************
//! @file   main.cpp
//! @brief  describe
//! @author d_nishimura
//**********************************************************************
#include <iostream>
#include <vector>
#include "Utility.h"
#include "MPL/MPLList.h"


#include <unordered_set>

template <size_t N, typename DataType>
struct HogeClass
{
    typedef typename static_if<N==1, DataType, std::vector<DataType> >::type type;
    static const size_t NUM = N;
};

typedef MPL::list<HogeClass<1, int>, HogeClass<2, int>, HogeClass<3, int> >::type HogeTypeList;
typedef MPL::begin<HogeTypeList>::type HogeTypeListBegin;
typedef MPL::end<HogeTypeList>::type HogeTypeListEnd;

constexpr int GetHogeHoge(int hoge)
{
    return hoge*2;
};




int main(int argc, char* argv[])
{
    HogeClass<100, int>::type Widget;

    std::cout << "Hello. :" << GetHogeHoge(GetSize(Widget)) << std::endl;
    std::cout << "Hello. :" << GetHogeHoge(1) << std::endl;

    return 0;
}

