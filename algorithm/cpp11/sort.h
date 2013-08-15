//**********************************************************************
//! @file   sort.h
//! @brief  describe
//**********************************************************************
#ifndef _ALGORITHM_SORT_H_INCLUDED_
#define _ALGORITHM_SORT_H_INCLUDED_

namespace algorithm {

    template <typename Itrator, typename CompFunc>
    void quicksort(Iterator& begin, Iterator& end, CompFunc& compare);

}   // namespace algorithm

#endif // _ALGORITHM_SORT_H_INCLUDED_
