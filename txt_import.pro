FUNCTION txt_import, file, nl_header=nl_header

  nl=FILE_LINES(file)
  str=STRARR(nl)
  
  OPENR, unit, file, /GET_LUN
  READF, unit, str
  CLOSE, unit
  FREE_LUN, unit
  
  IF KEYWORD_SET(nl_header) THEN $
    struct={header: str[0:nl_header-1], data: str[nl_header:-1]} $
  ELSE $
    struct={header: '', data: str}

  RETURN, struct
  
END