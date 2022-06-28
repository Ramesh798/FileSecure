
function validate() {
    var email,password;
    email = document.getElementById("email")
    password = document.getElementById("password")

    
    
    if(email.value.length == 0){
        alert('Please Enter Valid Email id')
        email.focus();
        return false;
    }

    if(password.value.length < 6){
        alert("Please enter valid password")
        password.focus();
        return false;
    }else{
        return true;
    }
    
      
    
}
function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
      x.type = "text";
    } else {
      x.type = "password";
    }
  }
// let mobile = document.getElementById("mobile")
// let myFormEl = document.getElementById("myForm")
// let nameErrMsgEl = document.getElementById("nameError");
// mobile.addEventListener("blur", function(event) {
//     if (event.target.value === "") {
//       nameErrMsgEl.textContent = "Required*";
//     } else {
//       nameErrMsgEl.textContent = "";
//     }
//   });

//   myFormEl.addEventListener("submit", function(event) {
//     event.preventDefault();
//   });


  