" Inspired by http://www.debian-administration.org/article/381/Updating_bind_serial_numbers_automatically

function UPDSERIAL(date, num)
  if (strftime("%Y%m%d") == a:date)
    return a:date . a:num+1
  endif
  return strftime("%Y%m%d") . '01'
endfunction

command Soa :%s/\(2[0-9]\{7}\)\([0-9]\{2}\)\(\s*;\s*serial\s*\)/\=UPDSERIAL(submatch(1),submatch(2)) . submatch(3)/g

autocmd BufNewFile,BufRead /etc/bind/primary/* Soa
