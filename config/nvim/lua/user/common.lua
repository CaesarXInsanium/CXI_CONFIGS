REQUIRE = function(name, config)
  local status, module = pcall(require, name)
  if not status then
    print(name .. "could not be called")
    return
  end
  module.setup(config)
  return module
end
