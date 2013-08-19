cmake_minimum_required(VERSION 2.6)

set(PROJECT_NAME helloWithMyLib)
set(HELLOLIB_NAME ${PROJECT_NAME}_lib)

project(${PROJECT_NAME})

add_subdirectory(lib/hellolib)

include_directories(${CMAKE_SOURCE_DIR}/lib/hellolib ${CMAKE_SOURCE_DIR})

# link lib directory
link_directories(${CMAKE_SOURCE_DIR}/lib/hellolib)

add_executable(${PROJECT_NAME} main.cpp)

# 親の階層の変数（set(hoge piyo)されているときの${hoge}）はsubdirから参照可
# この階層の変数は親階層では参照不可
target_link_libraries(${PROJECT_NAME} ${HELLOLIB_NAME})
#target_link_libraries(${PROJECT_NAME} piyo)
