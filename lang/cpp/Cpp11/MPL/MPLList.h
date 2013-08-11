//**********************************************************************
//! @file   MPLList.h
//! @brief  type list
//**********************************************************************
#ifndef _MPLLIST_H_INCLUDED_
#define _MPLLIST_H_INCLUDED_


namespace MPL {

// NULL class
class NullType {};

template <typename T, typename U>
struct Typelist
{
    typedef T Head;
    typedef U Tail;
};

// タイプリスト
template <typename T0, typename T1
        , typename T2 = NullType
        , typename T3 = NullType
        , typename T4 = NullType
        , typename T5 = NullType
        , typename T6 = NullType
        , typename T7 = NullType
        , typename T8 = NullType
>

struct list {
    typedef Typelist<T0, Typelist<T1
                        , Typelist<T2
                        , Typelist<T3
                        , Typelist<T4
                        , Typelist<T5
                        , Typelist<T6
                        , Typelist<T7
                        , Typelist<T8, Typelist<NullType, NullType> > > > > > > > > > type;
};

template <typename Cnt>             struct f_ite{ typedef typename Cnt::Head type; typedef f_ite<typename Cnt::Tail> next; };
template <typename Cnt>             struct begin{ typedef f_ite<Cnt> type; };
template <typename H, typename T>   struct endL { typedef typename endL<typename T::Head, typename T::Tail>::type type; };
template <typename T>               struct endL<NullType, T>{ typedef Typelist<NullType, T> type; };
template <typename Cnt>             struct end  { typedef f_ite<typename endL<typename Cnt::Head, typename Cnt::Tail>::type> type; };
template <typename Ite>             struct next { typedef typename Ite::next type; };
template <typename Ite>             struct deref{ typedef typename Ite::type type; };


}   // namespace MPL

#endif // _MPLLIST_H_INCLUDED_

