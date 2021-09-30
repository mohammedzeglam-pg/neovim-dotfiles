local table = {
  ['true'] = 'false',
  ['false'] = 'true',
  ['True'] = 'False',
  ['False'] = 'True',
  ['TRUE'] = 'FALSE',
  ['FALSE'] = 'TRUE',
  ['Yes'] = 'No',
  ['YES'] = 'NO',
  ['1'] = '0',
  ['<'] = '>',
  ['+'] = '-',
  ['==='] = '!==',
  ['=='] = '!=',
  ['!=='] = '===',
  ['!='] = '==',
}
local function errorHandler(err)
  if not err == nil then
    print('Error toggling to alternate value. Err: ' .. err)
  end
end
--@Param str string
return function(str)
  if table[str] == nil then
    print('Unsupported alternate value.')
    return
  end

  xpcall(vim.cmd('normal ciw' .. table[str]), errorHandler)
end
