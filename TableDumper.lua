-- You can use this as a stand-alone function by removing the return at the end or use it from a module, just run DumpTable(Table) and it will return that table converted to a string

local DumpTable; do
    DumpTable = function(Table, IndentAmount)
        local IndentAmount, TableAmount, Amount = IndentAmount or 1, 0, 0
        local Indent = ("    "):rep(IndentAmount)

        for Index in pairs(Table) do
            TableAmount = TableAmount + 1
        end

        local TableDump, Ending = {((TableAmount > 0 and "{\n") or "{")}, (((IndentAmount > 1 and TableAmount > 0) and "},\n") or "}")

        for Index, Value in pairs(Table) do
            local ValueType = type(Value)
            Amount = Amount + 1

            local FixedValue = ((ValueType == "string" or ValueType == "function") and "\"" .. tostring(Value) .. "\"" or tostring(Value))
            local Data = ((ValueType ~= "table" and "[\"" .. tostring(Index) .. "\"] = " .. FixedValue or "[\"" .. tostring(Index) .. "\"] = " .. DumpTable(Value, IndentAmount + 1)))
            local Key = Indent .. ((ValueType ~= "table" and Data .. ((Amount ~= TableAmount and ",\n") or "")) or Data)

            TableDump[#TableDump + 1] = Key
        end

        TableDump[#TableDump + 1] = ((TableAmount > 0 and "\n") or "") .. (((IndentAmount > 1 and TableAmount > 0) and ("    "):rep(IndentAmount - 1) .. Ending or Ending .. ((TableAmount == 0 and ",\n") or "")))

        return table.concat(TableDump)
    end
end

return DumpTable
