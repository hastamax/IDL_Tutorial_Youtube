FUNCTION array1D_get_matchix, ref_arr, comp_arr, CASE_SENSI=case_sensi

  type_ref=SIZE(ref_arr, /TYPE)
  type_comp=SIZE(comp_arr, /TYPE)
  
  IF type_ref NE type_comp THEN RETURN, -1
  
  IF NOT KEYWORD_SET(case_sensi) AND type_ref EQ 7 THEN BEGIN
    ref_arr=STRUPCASE(ref_arr)
    comp_arr=STRUPCASE(comp_arr) 
  ENDIF
  
  match_ix=MAKE_ARRAY(N_ELEMENTS(ref_arr), /LONG, VALUE=-1)
  FOR n=0, N_ELEMENTS(ref_arr)-1 DO IF (WHERE(comp_arr EQ ref_arr[n]))[0] NE -1 THEN match_ix[n]=n
  
  w=WHERE(match_ix NE -1, nw)
  IF nw GT 0 THEN match_ix=match_ix[w] ELSE match_ix=-1
  
  RETURN, match_ix
  
END