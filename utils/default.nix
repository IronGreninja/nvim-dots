{
  map = mode: lhs: rhs: opts: {
    inherit mode;
    key = lhs;
    action = rhs;
    options =
      {
        silent = true;
        noremap = true;
      }
      // opts;
  };

  raw = str: {__raw = str;};

  wk = lhs: group: opts:
    {
      __unkeyed-1 = lhs;
      inherit group;
    }
    // opts;
}
