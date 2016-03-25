select objectId,classId,loanidnumber,previousbal,currentbal,histdate
from afthistory
where previousbal<currentbal-10
order by histdate
