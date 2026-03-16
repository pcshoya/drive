function checkValue(){
    if(document.frm.drv_date.value == ""){
        alert("주행일자가 입력되지 않았습니다!");
        document.frm.drv_date.focus();
        return false;
    }
    if(document.frm.car_no.value == ""){
        alert("차량번호가 입력되지 않았습니다!");
        document.frm.car_no.focus();
        return false;
    }
    if(document.frm.drv_start.value == ""){
        alert("출발Km가 입력되지 않았습니다!");
        document.frm.drv_start.focus();
        return false;
    }

    if(document.frm.drv_end.value == ""){
        alert("도착Km가 입력되지 않았습니다!");
        document.frm.drv_end.focus();
        return false;
    }

    if(document.frm.dept_code.value == ""){
        alert("부서코드가 선택되지 않았습니다!");
        document.frm.dept_code.focus();
        return false;
    }

    if(document.frm.drv_money.value == ""){
        alert("주유금액이 입력되지 않았습니다!");
        document.frm.drv_money.focus();
        return false;
    }
    return true;
}