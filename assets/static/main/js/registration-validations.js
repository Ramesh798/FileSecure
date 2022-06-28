
function validate() {
    var fname, mobile, EmailId, password,cpassword;
    fname = document.getElementById("name")
    EmailId = document.getElementById("email")
    mobile = document.getElementById("mobile")
    password = document.getElementById("pwd")
    cpassword = document.getElementById("cpwd")
    
    // emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/; // to validate email id

    if (fname.value.length <= 0) {
        alert("Please Enter You Name ");
        fname.focus();
        return false;
    }
    if (EmailId.value.length <= 0) {
        alert("Please Give Valid Email Id");
        EmailId.focus();
        return false;   
    }
    // if (EmailId != 0 ) {

    //     if (!EmailId.match(emailExp)) {

    //         alert("Invalid Email Id");

    //         return false;

    //     }

    // }
    if (isNaN(mobile.value)){
        alert("Please Enter Your Mobile number");
        mobile.focus();
        return false;
    }
    if(mobile.value.length !=10){
        alert('invalid mobile')
        mobile.focus();
        return false;
    }
    
    // if (isNaN(password.value)){
    //     alert("Please pwd make sure more more than 6 char");
    //     password.focus();
    //     return false;
    // }
    if (password.value.length < 6) {
        alert("Please Enter Your password")
        password.focus();
        return false;
    }
    if (cpassword.value.length < 6) {
        alert("Please Enter Your confirm password")
        cpassword.focus();
        return false;
    }
    else {
        return true;
    }
}
