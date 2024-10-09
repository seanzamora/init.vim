local configs = require 'lspconfig.configs';

configs.ast_grep = {
  default_config = {
    cmd = {'ast-grep', 'lsp'};
    single_file_support = false;
    root_dir = nvim_lsp.util.root_pattern('sgconfig.yml');
  };
}
