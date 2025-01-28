{
  plugins.lualine = {
    enable = true;
    lazyLoad.settings.event = "VimEnter";
    luaConfig.pre = "vim.opt.showmode = false";
    settings = {
      options = {
        globalstatus = true;
        icons_enabled = true;
        component_separators = "|";
        section_separators = "";
      };
      sections = {
        lualine_a = [{__unkeyed = "mode";}];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon = "";
          }
        ];
        lualine_c = [
          {
            __unkeyed = "filename";
            # 0=just filename, 1=relative path, 2=absolute path
            path = 1;
            symbols = {
              modified = " ";
              readonly = " ";
            };
          }
          {__unkeyed = "diff";}
        ];
        lualine_x = [
          {
            # Lsp server name
            __unkeyed.__raw = ''
              function()
                local buf_ft = vim.api.nvim_get_option_value("filetype", {})

                -- List of buffer types to exclude
                local excluded_buf_ft = { "toggleterm", "NvimTree", "neo-tree", "TelescopePrompt" }

                -- Check if the current buffer type is in the excluded list
                for _, excluded_type in ipairs(excluded_buf_ft) do
                  if buf_ft == excluded_type then
                    return ""
                  end
                end

                -- Get the name of the LSP server active in the current buffer
                local clients = vim.lsp.get_active_clients()
                local msg = ""

                -- if no lsp client is attached then return the msg
                if next(clients) == nil then
                  return msg
                end

                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end

                return msg
              end
            '';
            icon = " ";
          }
          {
            __unkeyed = "diagnostics";
            sources = ["nvim_lsp" "nvim_diagnostic"];
            update_in_insert = false;
            always_visible = false;
          }
        ];
        lualine_y = [
          {
            __unkeyed = "filetype";
            icon_only = true;
          }
          "encoding"
          {
            __unkeyed = "fileformat";
          }
        ];
        lualine_z = [
          {
            __unkeyed = "progress";
            separator = "";
          }
          {
            __unkeyed = "location";
            separator = "";
          }
        ];
      };
    };
  };
}
