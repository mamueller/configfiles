-- create a link to this file in  ~/.config/nvim

-- local iron=require("iron")
 -- iron.core.add_repl_definitions{
 --   python = {
 --     mycustom = {
 --       command = "mycmd"
 --     }
 --   }
 -- }
local iron=require("iron")
iron.core.add_repl_definitions{
  python = {
    venv_python = {
      -- Note that the command is a string and not a table.
      -- This allows neovims job to find the correct binary throught the path.
      --command = "/home/mm/env_bgc/bin/ipython"
      command = "/home/mm/env_bgc/bin/ipython --no-autoindent --pprint"
    }
  }
}
iron.core.set_config{preferred = {python = "venv_python"}}
