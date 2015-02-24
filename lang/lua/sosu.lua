#!/usr/bin/env luajit

function isSosu(num)
    -- 素数かどうかの確認
    if num <= 1 then
        return true
    elseif num == 2 then
        return true
    elseif num % 2 == 0 then
        return false
    end

    local rangemax = num / 2 - 1
    for i = 2, rangemax do
        kisu = i * i + 1
        if num % kisu == 0 then
            return false
        end
    end

    return true
end

function sosu(min, max)
    array = {}
    for i = 1, max + 1 do
        if isSosu(i) then
            table.insert(array, i)
        end
    end

    return array
end

array =  sosu(1, 10000)
num = #array
for i, value in ipairs(array) do
    print(i, value)
end

