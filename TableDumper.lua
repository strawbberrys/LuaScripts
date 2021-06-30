local DumpTable; do
    DumpTable = function(Table, IndentAmount)
        local IndentAmount, TableAmount, Amount = IndentAmount or 1, 0, 0
        local Indent = ("    "):rep(IndentAmount)

        for Index in pairs(Table) do
            TableAmount++
        end

        local TableDump, Ending = {((TableAmount > 0 and "{\n") or "{")}, (((IndentAmount > 1 and TableAmount > 0) and "},\n") or "}")

        for Index, Value in pairs(Table) do
            Amount++

            local FixedValue = ((type(Value) == "string" or type(Value) == "function") and "\"" .. tostring(Value) .. "\"" or tostring(Value))
            local Data = table.concat(((type(Value) ~= "table" and {"[\"" .. tostring(Index) .. "\"] = ", FixedValue}) or {"[\"" .. tostring(Index) .. "\"] = ", DumpTable(Value, IndentAmount + 1)}))
            local Key = {Indent, ((type(Value) ~= "table" and table.concat({Data, ((Amount ~= TableAmount and ",\n") or "")})) or Data)}

            TableDump[#TableDump + 1] = table.concat(Key)
        end

        TableDump[#TableDump + 1] = table.concat({((TableAmount > 0 and "\n") or ""), (((IndentAmount > 1 and TableAmount > 0) and table.concat({("    "):rep(IndentAmount - 1), Ending}) or table.concat({Ending, ((TableAmount == 0 and ",\n") or "")})))})

        return table.concat(TableDump)
    end
end

local old = os.clock()
for i = 1, 1000 do
    DumpTable(getgenv())
end
print(os.clock() - old)