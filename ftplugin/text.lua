local special_key = {
  l = [[…]],
  d = [[—]],
}

special_key['%'] = [[\%]]

for name, val in pairs(special_key) do
  vim.keymap.set('i', '%' .. name, val)
end

-- /* /* …… */ */
-- /* /* —— */ */
-- /**/
