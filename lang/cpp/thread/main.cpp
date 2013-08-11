//**********************************************************************
//! @file   main.cpp
//! @brief  describe
//! @author d_nishimura
//**********************************************************************
#include <iostream>

#include <thread>

// constexpr int GetHogeHoge()
// {
//     return 1;
// };


void call_from_thread()
{
    std::cout << "Hello World."  << std::endl;
}


int main(int argc, char* argv[])
{
    std::thread t1(call_from_thread);

    t1.join();
//     int* ptr = nullptr;
//     std::cout << "Hello :" << ptr << std::endl;

    return 0;
}

