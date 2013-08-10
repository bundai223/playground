//**********************************************************************
//! @file   Utility.h
//! @brief  describe
//! @author d_nishimura
//**********************************************************************
#ifndef _UTILITY_H_INCLUDED_
#define _UTILITY_H_INCLUDED_


//**********************************************************************
//! @brief  配列サイズ取得
//! @param  配列・vector
//! @retval サイズ数
//**********************************************************************
template <typename T, size_t N>
size_t GetSize(const T(&)[N])
{
    return N;
}

template <typename T>
size_t GetSize(const std::vector<T>& v)
{
    return v.size();
}

template <typename T>
size_t GetSize(const T&)
{
    return 1;
}

//**********************************************************************
//! @brief  static if
//! @retval 
//**********************************************************************
template <bool C, typename T, typename F>
struct static_if{typedef T type; };

template <typename T, typename F>
struct static_if<false, T, F>{ typedef F type; };

#endif // _UTILITY_H_INCLUDED_

