--------------------------------------------------------------------------------
---                           Utility Plugins                                ---
--------------------------------------------------------------------------------

---@diagnostic disable:missing-fields
---@type LazyPluginBase[]
return {
  {
    'machakann/vim-sandwich',
    keys = {
      { 'sa', mode = 'n' },
      { 'sd', mode = 'n' },
      { 'sr', mode = 'n' },
      { 'sa', mode = 'v' },
      { 'sd', mode = 'v' },
      { 'sr', mode = 'v' },
    },
  },
}
