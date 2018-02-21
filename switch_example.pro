PRO switch_example

  a = '46'
  SWITCH a OF
    'a': print, 'a'
    'b': print, 'b'
    'c': print, 'c'
    '46': print, '46'
    '0': BEGIN
          print, '0'
          BREAK
         END
    ELSE: print, 'else case'
  ENDSWITCH
END