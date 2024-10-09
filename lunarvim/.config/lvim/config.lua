-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


-- 在 Lua 中定义 CompileAndRunCpp 函数
_G.CompileAndRun_2 = function()
    -- 在这里插入编译和运行 C++ 程序的代码
    local file_name = vim.fn.expand('%:t:r')
    local file_ext = vim.fn.expand('%:e')

    vim.cmd('write')
    vim.cmd('split')
    --vim.cmd('term g++ ' .. '-std=c++11 ' .. file_name .. '.cpp -o ' .. file_name .. ' && ./' .. file_name)

    if file_ext == 'cpp' then
        vim.cmd('term g++ ' .. '-std=c++11 ' .. file_name .. '.cpp -o ' .. file_name .. ' && ./' .. file_name)
    elseif file_ext == 'py' then
        vim.cmd('term python3 ' .. file_name .. '.py')
    end

    vim.cmd('startinsert')
end

-- 在 Lua 中定义 CompileAndRunCpp 函数
_G.CompileAndRun = function()
    local file_name = vim.fn.expand('%:t:r')
    local file_ext = vim.fn.expand('%:e')

    -- 在这里插入编译和运行 C++ 程序的代码
    vim.cmd('write')
    --local file_name = vim.fn.expand('%:t:r')
    vim.cmd('split')
    vim.cmd('resize 10')
    -- vim.cmd('term g++ ' .. file_name .. '.cpp -o ' .. file_name .. ' && ./' .. file_name)

    if file_ext == 'cpp' then
        vim.cmd('term g++ ' .. '-std=c++11 ' .. file_name .. '.cpp -o ' .. file_name .. ' && ./' .. file_name)
    elseif file_ext == 'py' then
        vim.cmd('term python3 ' .. file_name .. '.py')
    end

    vim.cmd('startinsert')
end

-- 绑定 Ctrl+C 和 Ctrl+V 快捷键
lvim.keys.normal_mode["<C-c>"] = ":lua CompileAndRun()<CR>"
lvim.keys.normal_mode["<C-v>"] = ":lua CompileAndRun_2()<CR>"

-- lvim.leader = ","
lvim.leader = "1"

-- 设置tab长度为4
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- 设置 normal 模式下的快捷键
lvim.keys.normal_mode["<leader>3"] = ":bn<CR>"
lvim.keys.normal_mode["<leader>2"] = ":bp<CR>"

--lvim.keys.normal_mode["<leader>j"] = "15j"
--lvim.keys.normal_mode["<leader>k"] = "15k"

lvim.plugins = {
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({})
        end
    }
}

-- 定义切换 Codeium 启用状态的函数
function ToggleCodeium()
  if vim.g.codeium_enabled then
    vim.g.codeium_enabled = false
    print("Codeium disabled")
  else
    vim.g.codeium_enabled = true
    print("Codeium enabled")
  end
end

-- 设置快捷键
lvim.keys.normal_mode["<leader>tc"] = ":lua ToggleCodeium()<CR>"

--vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
--vim.keymap.set('i', '<C-;>', function() return vim.fn [oai_citation:1,Error](data:text/plain;charset=utf-8,%E6%89%BE%E4%B8%8D%E5%88%B0%E5%85%83%E6%95%B0%E6%8D%AE) end, { expr = true, silent = true })
--vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
--vim.keymap.set('i', '<C-.>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
--vim.keymap.set('i', '<C-.>', function() return vim.fn['codeium#Complete()']() end, { expr = true, silent = true })


