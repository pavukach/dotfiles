return {
  "Wansmer/langmapper.nvim",
  lazy = false,
  priority = 1,
  config = function()
    local langmapper = require("langmapper")

    langmapper.setup({
      hack_keymap = false,
      layouts = {
        ua = {
          id = "ua",
          layout = "ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯБЮЖЄХЇʼ,фисвуапршолдьтщзйкіегмцчнябюжєхї'.",
          default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}~?abcdefghijklmnopqrstuvwxyz,.;'[]`/]],
        },
      },
      os = {
        Linux = {
          get_current_layout_id = function()
            local cmd = "hyprctl"
            if vim.fn.executable(cmd) then
              local output = vim.fn.system(
                cmd .. " devices -j | jq -r '.keyboards[] | .active_keymap' | head -n1 | cut -c1-2 | tr 'a-z' 'A-Z'"
              )
              return output
            end
          end,
        },
      },
    })

    langmapper.hack_get_keymap()
  end,
}
