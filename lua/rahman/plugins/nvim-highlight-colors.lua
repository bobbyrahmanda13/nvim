return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPre",
  opts = {
    render = "background",
    enable_hex = true,
    enable_short_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_hsl_without_function = true,
    enable_ansi = true,
    enable_var_usage = true,
    enable_tailwind = true,
    virtual_symbol = '■',
    virtual_symbol_prefix = '',
    virtual_symbol_suffix = ' ',
    virtual_symbol_position = 'inline',
  }
}
