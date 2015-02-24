#!/usr/bin/env luajit


function gusu(min, max)
    array = {}
    for i = 1, max + 1 do
        if i % 2 == 0 then
            table.insert(array, i)
        end
    end

    return array
end

array = gusu(1, 100)
num = #array
for i = 1, num do
    print(i .. ": " .. array[i])
end
