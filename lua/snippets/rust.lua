local session = require("luasnip.session")
local env = session.config.snip_env
local parse = env["parse"]

return {
  parse("match", [[
  let result = match T {
      Ok(data) => data,
      Err(e) => return Err(e),
  };
  ]])
}
