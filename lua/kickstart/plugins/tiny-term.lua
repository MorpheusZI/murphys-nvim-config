vim.pack.add { 'https://github.com/jellydn/tiny-term.nvim' }

local tiny_term = require 'tiny-term'

tiny_term.setup {
  win = {
    width = 0.8,
    height = 0.8,
    split_size = 15,
    position = "float"
  },
}

local function switch_terminal(direction)
  local terms = tiny_term.list()
  if #terms == 0 then
    vim.notify("No active terminals", vim.log.levels.INFO)
    return
  end

  local current_idx = 1
  for i, term in ipairs(terms) do
    if term:is_visible() then
      current_idx = i
      break
    end
  end

  if direction == "next" then
    current_idx = current_idx % #terms + 1
  else
    current_idx = (current_idx - 2) % #terms + 1
  end

  for _, term in ipairs(terms) do
    term:hide()
  end
  terms[current_idx]:show()
end

local new_term = function()
  tiny_term.open()
end

local next_term = function()
  switch_terminal("next")
end

local prev_term = function()
  switch_terminal("prev")
end

local toggle_term = function()
  tiny_term.toggle()
end

local kill_term = function()
  local terms = tiny_term.list()
  for _, term in ipairs(terms) do
    if term:is_visible() then
      term:close()
      return
    end
  end
  vim.notify("No active terminal to kill", vim.log.levels.INFO)
end

local telescope_terminals = function()
  local terms = tiny_term.list()
  if #terms == 0 then
    vim.notify("No active terminals", vim.log.levels.INFO)
    return
  end

  local ok, pickers = pcall(require, 'telescope.pickers')
  local _, finders = pcall(require, 'telescope.finders')
  local _, conf = pcall(require, 'telescope.config')
  local _, actions = pcall(require, 'telescope.actions')
  local _, action_state = pcall(require, 'telescope.actions.state')

  if ok then
    pickers.new({}, {
      prompt_title = 'Active Terminals',
      finder = finders.new_table {
        results = terms,
        entry_maker = function(term)
          return {
            value = term,
            display = string.format("Terminal [%s]", term.id or "shell"),
            ordinal = term.id or "shell",
          }
        end,
      },
      sorter = conf.values.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection then
            for _, t in ipairs(terms) do t:hide() end
            selection.value:show()
          end
        end)
        return true
      end,
    }):find()
  else
    vim.ui.select(terms, {
      prompt = 'Select Terminal:',
      format_item = function(term)
        return string.format("Terminal [%s]", term.id or "shell")
      end,
    }, function(choice)
      if choice then
        for _, t in ipairs(terms) do t:hide() end
        choice:show()
      end
    end)
  end
end

vim.keymap.set('n', '<leader>tn', new_term, { desc = 'Terminal new' })
vim.keymap.set('n', '<leader>tp', next_term, { desc = 'Terminal plus (next)' })
vim.keymap.set('n', '<leader>tm', prev_term, { desc = 'Terminal minus (prev)' })
vim.keymap.set('n', '<leader>to', toggle_term, { desc = 'Terminal toggle' })
vim.keymap.set('n', '<leader>tk', kill_term, { desc = 'Terminal kill' })
vim.keymap.set('n', '<leader>tt', telescope_terminals, { desc = 'Terminal telescope search' })

local ok, wk = pcall(require, 'which-key')
if ok then
  wk.add {
    { '<leader>t', group = 'Terminal' },
    { '<leader>tn', desc = 'Terminal new' },
    { '<leader>tp', desc = 'Terminal plus (next)' },
    { '<leader>tm', desc = 'Terminal minus (prev)' },
    { '<leader>to', desc = 'Terminal toggle' },
    { '<leader>tk', desc = 'Terminal kill' },
    { '<leader>tt', desc = 'Terminal telescope search' },
  }
end
