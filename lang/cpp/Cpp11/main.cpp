//**********************************************************************
//! @file   main.cpp
//! @brief  describe
//! @author d_nishimura
//**********************************************************************
#include <iostream>
#include <vector>

int main(int argc, char* argv[])
{
    std::vector<int> hoge;
    hoge.push_back(1);
    hoge.push_back(10);
    hoge.push_back(5);

    for(auto it = hoge.begin(); it != hoge.end(); ++it)
    {
        std::cout << "Hello. :" << *it << std::endl;
    }
    return 0;
}

