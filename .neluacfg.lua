local function run(cmd) print(cmd) os.execute(cmd) end
local targets = {
  {'001-hw', 'hw'},
  {'002-asteroids', 'asteroids'},
  {'003-asteroids', 'asteroids'},
}

if #arg == 1 and arg[1] == 'all' then
  run 'nelua make 1'
  run 'nelua make 2'
  run 'nelua make 3'
  arg = {'-i', ''}
elseif #arg == 1 and arg[1] == 'clean' then
  for _, t in ipairs(targets) do
    local exe = t[1]..'/'..t[2]
    print('rm -fv '..exe)
    os.remove(exe)
  end
  arg = {'-i', ''}
elseif #arg == 1 and arg[1] == 'deps' then
  run 'git clone https://github.com/AuzFox/Raylib.nelua.git'
  run 'git clone https://github.com/edubart/nelua-batteries'
  run 'wget https://warmplace.ru/soft/sunvox/sunvox_lib-2.1.1.zip'
  run 'unzip sunvox_lib-2.1.1.zip'
  arg = {'-i', ''}
elseif #arg > 1 and arg[1] == 'make' then
  local t = targets[tonumber(arg[2])]
  local flag = arg
  arg = {'-V', '-Llib', '-LRaylib.nelua', '-Lnelua-batteries', '-r', '-Pnogc', '-Paudio', '-o', t[1]..'/'..t[2], t[1]..'/'..t[2]..'.nelua'}
  for i=3, #flag do table.insert(arg, flag[i]) end
elseif #arg > 1 and arg[1] == 'run' then
  local t = targets[tonumber(arg[2])]
  local flag = arg
  arg = {'-V', '-Llib', '-LRaylib.nelua', '-Lnelua-batteries', '-r', '-Pnogc', '-Paudio',                        t[1]..'/'..t[2]..'.nelua'}
  for i=3, #flag do table.insert(arg, flag[i]) end
end
return {}
