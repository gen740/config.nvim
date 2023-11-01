local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  local special_key = {
    l = [[…]],
    d = [[—]],
  }

  special_key['%'] = [[\%]]

  for name, val in pairs(special_key) do
    lmap('i', '%' .. name, val)
  end

  -- /* /* …… */ */
  -- /* /* —— */ */
  -- /**/
end

return M
