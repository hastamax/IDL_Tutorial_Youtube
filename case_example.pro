PRO case_example

;  a = 10
;  
;  CASE a OF
;    1: BEGIN
;        print, 'a is 1.'
;        
;        
;       END
;    2: print, 'a is 2.'
;    3: print, 'a is 2.'
;    ELSE: print, 'case statement: no match.'
;  ENDCASE
;  
;  
;  CASE 1 OF
;    (a EQ 1): print, 'a is 1.'
;    (a EQ 2): print, 'a is 2.'
;    (a EQ 3): print, 'a is 2.'
;    ELSE: print, 'case statement: no match.'
;  ENDCASE

RESTORE, 'D:\Youtube\IDL_Tutorials\Case_Statement\xdata.sav'
RESTORE, 'D:\Youtube\IDL_Tutorials\Case_Statement\ydata.sav'

  parms=poly_fit(x,y,2,YFIT=yfit)
  
  p=plot(x,y)
  p1=plot(x,yfit,'r',/OVERPLOT)
  
  x_extra=LINDGEN(100)+260L
  y_extra=polyfit_get_ydata(x_extra, parms)
  
  p2=plot(x_extra,y_extra,'b',/OVERPLOT)
  
END

FUNCTION polyfit_get_ydata, xdata, parms
  ydata=DBLARR(N_ELEMENTS(xdata))
  degr=N_ELEMENTS(parms)-1
  
  CASE degr OF
    1: ydata[*]=parms[0]+parms[1]*xdata[*]
    2: ydata[*]=parms[0]+parms[1]*xdata[*]+parms[2]*xdata[*]^2
    3: ydata[*]=parms[0]+parms[1]*xdata[*]+parms[2]*xdata[*]^2+parms[3]*xdata[*]^3
    4: ydata[*]=parms[0]+parms[1]*xdata[*]+parms[2]*xdata[*]^2+parms[3]*xdata[*]^3+parms[4]*xdata[*]^4
  ENDCASE

  RETURN, ydata
END