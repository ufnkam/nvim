function
function require(modname: string)
  -> unknown
  2. loaderdata: unknown
──────────────────────────────────────────────────────────
Loads the given module, returns any value returned by the searcher(`true` when `nil`). Besides that value, also returns as a second result the loader data returned by the searcher, which indicates how `require` found the module. (For instance, if the module came from a file, this loader data is the file path.)

[View documents](http://www.lua.org/manual/5.4/manual.html#pdf-require)
